class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :musical_tag_relations, dependent: :destroy
  has_many :musicals, through: :musical_tag_relations, dependent: :destroy
end
