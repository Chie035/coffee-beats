class ChangeDateTypeToResults < ActiveRecord::Migration[5.2]
  def change
    change_column :results, :type, :text
  end
end
