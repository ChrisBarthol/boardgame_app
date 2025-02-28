class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable, :omniauthable

  has_many :games, dependent: :destroy
  has_many :plays, through: :games

  validates :bgg_username, uniqueness: true, allow_nil: true
end
