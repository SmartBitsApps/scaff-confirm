class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :job_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
