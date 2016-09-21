class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.integer :manager_id
      t.integer :client_id
      t.boolean :public, default: false

      t.timestamps null: false
    end
  end
end
