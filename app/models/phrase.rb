class Phrase < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :examples
  acts_as_votable

  def score
      get_upvotes.size
  end

  accepts_nested_attributes_for :examples,  allow_destroy: true #позволяет использовать вложенные записи
end
