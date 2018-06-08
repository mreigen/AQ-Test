class Billboard < ApplicationRecord
  acts_as_votable

  validates_presence_of :name, :image_url
end