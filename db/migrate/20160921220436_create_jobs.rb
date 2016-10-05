class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :project, index: true, foreign_key: true
      t.integer :position_id
      t.integer :quantity
      t.integer :alternates
      t.integer :manager_id
      t.text :what_bring
      t.string :start_date
      t.string :end_date
      t.boolean :public, default: false
      t.integer :status, default: 0, null: false

      t.timestamps null: false
    end
  end
end
