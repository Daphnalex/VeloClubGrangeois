class Report < ApplicationRecord
  validates :title, presence: true
  validates :file, presence: true
  has_attached_file :document
  validates_attachment_content_type :document, content_type: /\Atext/
  validates_attachment_file_name :document, matches: [/doc\z/, /docx\z/, /odt\z/, /pdf\z/ ]
end
