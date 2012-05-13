class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :encrypted_password
      t.string :password_salt

      t.timestamps
    end
  end
end
