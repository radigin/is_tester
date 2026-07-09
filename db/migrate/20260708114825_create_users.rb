class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :user_login
      t.string :user_password
      t.string :email
      t.integer :is_real_admin
      t.text :hobbies

      t.timestamps null: false
    end
  end
end
