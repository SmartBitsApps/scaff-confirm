class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :owner, references: :users
      t.string :company_name
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :vat_id
      t.string :contact_person_name
      t.string :contact_phone
      t.boolean :public, default: false

      t.timestamps null: false
    end
  end
end
