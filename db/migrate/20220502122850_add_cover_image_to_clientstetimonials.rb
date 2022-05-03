class AddCoverImageToClientstetimonials < ActiveRecord::Migration[6.1]
  def change
    add_attachment :clientstetimonials, :cover_image
  end
end
