class Phrase < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :examples

  acts_as_votable

  accepts_nested_attributes_for :examples,  allow_destroy: true #позволяет использовать вложенные записи
end
