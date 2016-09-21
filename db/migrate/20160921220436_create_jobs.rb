class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :event, index: true, foreign_key: true
      t.integer :position_id
      t.integer :quantity
      t.integer :alternates
      t.integer :manager_id
      t.text :what_bring
      t.string :start_date
      t.string :end_date
      t.boolean :public
      t.integer :status

      t.timestamps null: false
    end
  end
end
