class Club < ApplicationRecord
  validates :phone, length: { is: 10 }, presence: true
  validates :title, presence: true
  validates :name, presence: true
  validates :mail, presence: true
end
