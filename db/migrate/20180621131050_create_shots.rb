# frozen_string_literal: true

class CreateShots < ActiveRecord::Migration[5.2]
  def change
    create_table :shots do |t|
      t.integer :project_id
      t.string :title
      t.string :tag
      t.text :description

      t.timestamps
    end
    add_index :shots, :project_id
  end
end
