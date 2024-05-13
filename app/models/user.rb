class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :musicals, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_musicals, through: :likes, source: :musical
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
  
  def already_liked?(musical)
    self.likes.exists?(musical_id: musical.id)
  end
  
  
end
