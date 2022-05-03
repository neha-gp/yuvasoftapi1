class CreateCareers < ActiveRecord::Migration[6.1]
  def change
    create_table :careers, id: :uuid do |t|
      t.string :name
      t.text :description
      t.attachment :cover_image

      t.timestamps
    end
  end
end
