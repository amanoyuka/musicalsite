class MusicalTagRelation < ApplicationRecord
  belongs_to :musical
  belongs_to :tag
end
