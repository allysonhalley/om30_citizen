class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postcode, null: false
      t.string :street, null: false
      t.string :complement
      t.string :district, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :ibge_code
      t.references :citizen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
