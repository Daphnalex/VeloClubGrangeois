class Article < ApplicationRecord
  has_attached_file :picture, default_url: "/images/article.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  
end
