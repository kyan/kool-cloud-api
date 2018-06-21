class CreateShots < ActiveRecord::Migration[5.2]
  def change
    create_table :shots do |t|
      t.integer :project_id
      t.string :name
      t.string :tag

      t.timestamps
    end
    add_index :shots, :project_id
  end
end
