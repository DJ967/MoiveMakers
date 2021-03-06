class User < ApplicationRecord
  establish_connection(:users)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Following and Unfollowing
  has_many :movies, dependent: :destroy

  has_one_attached :avatar, dependent: :destroy

  validates :username, uniqueness: true, length: { minimum:1}

end
