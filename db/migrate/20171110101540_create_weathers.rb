class CreateWeathers < ActiveRecord::Migration[5.1]
  def change
    create_table :weathers do |t|
      t.float :temp
      t.integer :humidity
      t.integer :pressure
      t.string :references
      t.string :location

      t.timestamps
    end
  end
end
