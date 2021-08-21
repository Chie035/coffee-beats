class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.integer :user_id
      t.integer :post_article_id
      t.text :comment

      t.timestamps
    end
  end
end
