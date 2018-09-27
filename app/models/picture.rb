class Picture < ApplicationRecord
  has_attached_file :image_one
  validates_attachment_content_type :image_one, content_type: /\Aimage\/.*\z/
  has_attached_file :image_two
  validates_attachment_content_type :image_two, content_type: /\Aimage\/.*\z/
  has_attached_file :image_three
  validates_attachment_content_type :image_three, content_type: /\Aimage\/.*\z/
  has_attached_file :image_four
  validates_attachment_content_type :image_four, content_type: /\Aimage\/.*\z/
end
