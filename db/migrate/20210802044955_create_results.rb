class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.string :type
      t.text :type_detail
      t.string :country

      t.timestamps
    end
  end
end
