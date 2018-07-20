# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :tag
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
