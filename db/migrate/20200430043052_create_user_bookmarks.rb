class CreateUserBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_bookmarks do |t|

      t.references :user, foreign_key: true
      t.references :bookmark, foreign_key: true

    end
  end
end
