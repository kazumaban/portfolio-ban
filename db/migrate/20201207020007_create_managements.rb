class CreateManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :managements do |t|
      t.integer    :age,          null: false
      t.integer    :gender,       null: false
      t.integer    :unit_price,   null: false
      t.references :user,         foreign_key: true
      t.references :record,       foreign_key: true
      t.timestamps
    end
  end
end
