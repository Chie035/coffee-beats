class RenameTypeColumnToResults < ActiveRecord::Migration[5.2]
  def change
    rename_column :results, :type, :result_
  end
end
