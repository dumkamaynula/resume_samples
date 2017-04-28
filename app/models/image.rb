class Image < ApplicationRecord
	belongs_to :album
	has_attached_file :picture, styles: { medium: "300x300>", large: "500x500>", very_large: "600x600>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
