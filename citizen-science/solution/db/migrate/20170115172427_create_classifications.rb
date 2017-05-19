class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.integer :user_id, null: false
      t.integer :experiment_id, null: false

      t.timestamps
    end
  end
end
