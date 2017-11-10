class CreateWeathers < ActiveRecord::Migration[5.1]
  def change
    create_table :weathers do |t|
      t.float :temp
      t.integer :humidity
      t.integer :pressure
      t.references :location

      t.timestamps
    end
  end
end
