class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true, index: true
      t.integer :residence
      t.string :street
      t.string :street_number
      t.string :city
      t.string :zip_code
      t.string :state
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
