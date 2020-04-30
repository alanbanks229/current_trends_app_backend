class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.json :article_data
      t.timestamps
    end
  end
end
