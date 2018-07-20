class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :role

      t.timestamps
    end
    add_index :memberships, [:project_id, :user_id]
  end
end
