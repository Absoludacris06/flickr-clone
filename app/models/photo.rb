class Photo < ActiveRecord::Base
	validates :file, presence: true
  mount_uploader :file, Uploader

  belongs_to :album
end
