class Billboard < ApplicationRecord
  acts_as_votable

  validates_presence_of :name, :image_url

  def users_liked
    self.votes_for.up.voters
  end

  def users_disliked
    self.votes_for.down.voters
  end

end