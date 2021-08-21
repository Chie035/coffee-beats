class ChangeDataTypeToResults < ActiveRecord::Migration[5.2]
  def change
     change_column :results, :type, :string
  end
end
