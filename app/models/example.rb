class Example < ApplicationRecord
  belongs_to :phrase

  acts_as_votable

end
