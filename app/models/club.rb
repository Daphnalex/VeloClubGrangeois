class Club < ApplicationRecord
  validates :title, presence: true
  validates :name, presence: true
  validates :avatar, presence: true
end
