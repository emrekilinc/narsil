class ChangeBacktraceTypeToTextExceptions < ActiveRecord::Migration
  def change
    change_column :errors, :backtrace, :text
  end
end
