class Example < ApplicationRecord
  include PublicActivity::Model
  tracked
  belongs_to :phrase

  acts_as_votable

  def score
    get_upvotes.size
  end

  def score2
    get_downvotes.size
  end


end
