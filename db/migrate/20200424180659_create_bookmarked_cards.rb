class CreateBookmarkedCards < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarked_cards do |t|
      t.json :article_data
      t.timestamps
    end
  end
end
