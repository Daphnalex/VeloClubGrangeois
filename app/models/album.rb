class Album < ApplicationRecord
  has_many :album_attachments
  accepts_nested_attributes_for :album_attachments
end
