class CreateDisciplineTags < ActiveRecord::Migration
  def change
    create_table :discipline_tags do |t|
      t.integer :experiment_id, null: false
      t.integer :discipline_id, null: false

      t.timestamps
    end
  end
end
