class CreateUserLogins < ActiveRecord::Migration
  def change
    create_table :user_logins do |t|
      t.datetime :logged_in_at
      t.string :ip
      t.integer :user_id

      t.timestamps
    end
  end
end
