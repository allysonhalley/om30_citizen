class CreateCitizens < ActiveRecord::Migration[6.0]
  def change
    create_table :citizens do |t|
      t.string :name, null: false
      t.string :cpf, null: false, unique: true
      t.string :cns, null: false, unique: true
      t.string :email, null: false, unique: true
      t.date :birth_date, null: false
      t.string :phone, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
