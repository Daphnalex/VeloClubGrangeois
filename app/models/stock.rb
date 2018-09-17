class Stock < ApplicationRecord
  validates :title, presence: true
  validates :front_image, presence: true
  validates :back_image, presence: true
  has_attached_file :front_image, styles: { large: "600x600>", medium: '300x300>', thumb: '100x100>'}, default_url: "/images/front/close.png"
  has_attached_file :back_image, styles: { large: "600x600>", medium: '300x300>', thumb: '100x100>'}, default_url: "/images/back/close.png"
  validates_attachment_content_type :front_image, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :back_image, content_type: /\Aimage\/.*\z/

end
