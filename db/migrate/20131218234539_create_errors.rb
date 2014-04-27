class CreateErrors < ActiveRecord::Migration
  def change
    create_table :errors do |t|
      t.string :project_code
      t.text :message
      t.string :url
      t.string :where
      t.datetime :occured_at
      t.string :browser
      t.string :ip
      t.string :backtrace

      t.timestamps
    end
  end
end
