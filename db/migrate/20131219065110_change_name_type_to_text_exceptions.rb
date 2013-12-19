class ChangeNameTypeToTextExceptions < ActiveRecord::Migration
  def change
    change_column :errors, :message, :text
  end
end
