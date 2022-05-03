class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs, id: :uuid do |t|
      t.string :category
      t.text :description
      t.string :title
      t.string :date
      t.attachment :cover_image

      t.timestamps
    end
  end
end
