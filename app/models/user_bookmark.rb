class UserBookmark < ApplicationRecord


    belongs_to :user
    belongs_to :bookmark

end