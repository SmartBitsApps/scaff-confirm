class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :user, index: true, foreign_key: true
      t.string :phone_number
      t.integer :degree_before
      t.integer :degree_after
      t.string :birth_name
      t.string :birth_date
      t.integer :gender
      t.string :birth_place
      t.string :birth_number
      t.integer :nationality
      t.integer :family_status
      t.string :bank_acc
      t.integer :insurance
      t.boolean :terms, default: false
      t.integer :status, default: 0, null: false

      t.timestamps null: false
    end
  end
end
