class Report < ApplicationRecord
  validates :title, presence: true
  validates :document, presence: true
  has_attached_file :document
  validates_attachment_content_type :document, content_type: ['application/doc', 'application/docx', 'application/odt', 'application/pdf', 'application/zip']
end
