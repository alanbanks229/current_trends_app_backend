class Bookmark < ApplicationRecord

    has_many :user_bookmarks
    has_many :users, through: :user_bookmarks

    serialize :bookmark, JSON
    include Serialization
end
