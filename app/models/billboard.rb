class Billboard < ApplicationRecord
  validates_presence_of :name, :image_url
end