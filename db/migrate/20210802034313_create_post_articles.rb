class CreatePostArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :post_articles do |t|
      t.integer :user_id
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
