class SessionsController < ApplicationController
    
    def create
        @user = User.find_by(email: session_params[:email])
        if @user && @user.authenticate(session_params[:password])
          #below we are calling helper method from application controller
          login!
          render json: {
            logged_in: true,
            user: @user
          }
        else
          render json: { 
            status: 401,
            errors: ['no such user', 'verify credentials and try again or signup']
          }
        end
    end

    def is_logged_in?
        if logged_in? && current_user
            if current_user.user_bookmarks
              bookmarks = current_user.user_bookmarks.map{ |obj| obj.id }
              render json: {
                logged_in: true,
                user: current_user,
                bookmarks: bookmarks
              }
            else
              render json: {
                logged_in: true,
                user: current_user
              }
            end
        else
          render json: {
            logged_in: false,
            message: 'no such user'
          }
        end
    end

    def destroy
        logout!
        render json: {
          status: 200,
          logged_out: true
        }
    end

    def user_bookmarks
      user_id = params[:user_id]
      @user = User.find_by(:id => user_id)
      if @user.bookmarks.length >= 1
        @bookmarks = @user.bookmarks
        matched_books = @bookmarks.map do |bookmark|
          currentbook = bookmark
          match = UserBookmark.where({user: @user, bookmark: currentbook})
          og_hash = bookmark.attributes
          og_hash[:match_id] = match.ids
          og_hash
        end
        render json: matched_books
      else
        render json: {
          message: ["You haven't bookmarked anything yet!"]
        }
      end
    end

    private

    def session_params
        params.require(:user).permit(:username, :email, :password)
    end
end