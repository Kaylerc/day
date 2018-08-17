class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :password
      t.string :name
      t.string :email
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
