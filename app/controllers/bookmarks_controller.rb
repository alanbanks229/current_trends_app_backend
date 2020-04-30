class BookmarksController < ApplicationController

    def index
        @cards = Bookmark.all
        if @cards
        render json: {
            bookmarks: @cards
        }
        else
        render json: {
            status: 500,
            errors: ['no cards found']
        }
        end
    end

    def show
        @card = Bookmark.find(params[:id])
        if @card
            render json: {
                user: @card
            }
        else
            render json: {
                status: 500,
                errors: ['card not found']
            }
        end
    end
    
    def create
        #byebug
        params.permit!
        @user = User.find(params[:user_id])
        @card = Bookmark.new(article_data: params[:article_data].as_json)
        ##getting error unknown attribute "author" which is most likely coming from data coming in
        ##How to store json as data in backend? running into an issue here.
        if @card.save
            @user_bookmark = UserBookmark.find_or_create_by(:user => @user, :bookmark => @card)
            render json: {
                status: :created,
                card: @card,
                user_bookmark: @user_bookmark,
                message: "This card has been bookmarked successfully"
            }
        else 
            render json: {
                status: 500,
                errors: @card.errors.full_messages
            }
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end