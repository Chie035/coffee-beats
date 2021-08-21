class RenameImageColumnToArticles < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :image, :image_id
  end
end
