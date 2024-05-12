class Like < ApplicationRecord
  belongs_to :musical
  belongs_to :user
  validates_uniqueness_of :musical_id, scope: :user_id
end
