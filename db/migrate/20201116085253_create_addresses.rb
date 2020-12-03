class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,    null: false
      t.text       :prefecture_id,  null: false
      t.integer    :city ,          null: false
      t.integer    :house_number,   null: false
      t.integer    :building_name
      t.string     :phone_number,   null: false
      t.references :record,         foreign_key: true
      t.timestamps
    end
  end
end
