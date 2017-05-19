class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :title, null: false
      t.integer :team_id, null: false

      t.timestamps
    end
  end
end
