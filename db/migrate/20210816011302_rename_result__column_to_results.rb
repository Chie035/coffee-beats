class RenameResultColumnToResults < ActiveRecord::Migration[5.2]
  def change
    rename_column :results, :result_, :result_type
  end
end
