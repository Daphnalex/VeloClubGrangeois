class Report < ApplicationRecord
  validates :title, presence: true
  validates :document, presence: true
  has_attached_file :document
  validates_attachment_content_type :document, content_type: ['application/doc', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/vnd.oasis.opendocument.text', 'application/pdf']
end
