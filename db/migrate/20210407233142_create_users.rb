class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email_address
      t.string :bio
      t.string :keyword
      t.string :password_digest
      t.boolean :admin

      t.timestamps
    end
  end
end
