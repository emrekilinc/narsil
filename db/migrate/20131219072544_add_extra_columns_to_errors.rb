class AddExtraColumnsToErrors < ActiveRecord::Migration
  def up
    add_column :errors, :format, :string
    add_column :errors, :method, :string
    add_column :errors, :headers, :text
    add_column :errors, :port, :string
    add_column :errors, :protocol, :string

    add_column :errors, :version, :string
    add_column :errors, :platform, :string
    add_column :errors, :bot, :boolean
    add_column :errors, :is_modern, :boolean
    add_column :errors, :browser_meta, :text
  end

  def down
    remove_column :errors, :format
    remove_column :errors, :method
    remove_column :errors, :headers
    remove_column :errors, :port
    remove_column :errors, :protocol

    remove_column :errors, :version
    remove_column :errors, :platform
    remove_column :errors, :bot
    remove_column :errors, :is_modern
    remove_column :errors, :browser_meta
  end
end
