class CreateCitizens < ActiveRecord::Migration[6.0]
  def change
    create_table :citizens do |t|
      t.string :name
      t.string :cpf
      t.string :cns
      t.string :email
      t.date :birth_date
      t.string :phone

      t.timestamps
    end
  end
end
