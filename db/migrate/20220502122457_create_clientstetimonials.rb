class CreateClientstetimonials < ActiveRecord::Migration[6.1]
  def change
    create_table :clientstetimonials, id: :uuid do |t|
      t.string :name
      t.text :description
      t.string :city

      t.timestamps
    end
  end
end
