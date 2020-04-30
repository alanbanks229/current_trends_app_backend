class UserBookmarksController < ApplicationController


    def index 
        @user_cards = UserBookmark.all
        if @user_cards
            render json: {
                relationships: @user_cards
            }
        else 
            render json: {
                status: 500,
                errors: ['No user has favorited a card yet']
            }
        end
    end

    def show
        @user_bookmark = UserBookmark.find_by(id: params[:id])
        render json: @user_bookmark
    end

    def destroy
        @user_bookmark = UserBookmark.find_by(id: params[:id])
        @user_bookmark.destroy
        render json: {
            message: ['Card sucessfully deleted...']
        }
    end


end
