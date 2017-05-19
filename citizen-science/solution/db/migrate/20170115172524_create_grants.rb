class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.integer :experiment_id, null: false
      t.integer :organization_id, null: false
      t.integer :amount

      t.timestamps
    end
  end
end
