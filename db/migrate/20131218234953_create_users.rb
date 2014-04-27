class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.text :bio
      t.string :password_hash
      t.string :password_salt
      t.string :membership_type
      t.string :full_name
      t.string :avatar
      t.boolean :is_closed
      t.datetime :closed_at
      t.string :remember_token
      t.string :last_logout_at
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.datetime :last_activity_at

      t.timestamps
    end
  end
end
