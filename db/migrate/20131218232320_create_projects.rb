class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :body
      t.string :logo
      t.boolean :is_active
      t.integer :order
      t.string :primary_color

      t.timestamps
    end
  end
end
