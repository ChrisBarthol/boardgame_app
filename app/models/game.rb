class Game < ApplicationRecord
  belongs_to :user
  has_many :plays, dependent: :destroy

  validates :bgg_id, uniqueness: {scope: :user_id}
end
