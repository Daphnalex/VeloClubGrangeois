class AlbumAttachment < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :album
end
