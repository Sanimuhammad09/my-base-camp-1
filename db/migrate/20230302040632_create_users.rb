class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :First_name
      t.string :Last_name
      t.text :Email
      t.string :password_digest
      t.boolean :isAdmin, :default => false

      t.timestamps
    end
  end
end
