class CreateScientists < ActiveRecord::Migration
  def change
    create_table :scientists do |t|
      t.string :name, null: false
      t.integer :organization_id

      t.timestamps
    end
  end
end
