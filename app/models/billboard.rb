class Billboard < ApplicationRecord
  acts_as_votable

  validates_presence_of :name, :image_url

  def users_liked
    self.votes_for.up.voters
  end

  def users_disliked
    self.votes_for.down.voters
  end

  def set_liked_by(user)
    self.liked_by(user)
    update_score
  end

  def set_disliked_by(user)
    self.disliked_by(user)
    update_score
  end

  private

  def update_score
    all_votes  = self.votes_for
    down_votes = all_votes.down.size
    up_votes   = all_votes.up.size
    score = up_votes - down_votes
    self.update_attribute(:score, score)
  end

end