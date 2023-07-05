class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :created_by
      t.string :user_id

      t.timestamps
    end
  end
end
