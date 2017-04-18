class Phrase < ApplicationRecord
  include PublicActivity::Model
   tracked recipient: ->(controller, model) { model && model.user }
  belongs_to :user
  belongs_to :category

  has_many :examples
  acts_as_votable

  def score
      get_upvotes.size
  end

  def short_name
    if phrase.size > 20
      phrase.slice(0..19) + '...'
    else
      phrase
    end
  end

  accepts_nested_attributes_for :examples,  allow_destroy: true #позволяет использовать вложенные записи
end
