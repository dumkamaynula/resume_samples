class PostSlide < ApplicationRecord
	has_attached_file :photo, styles: { large: "500x500>", very_large: "600x600>", def: "1280x1280>"}, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  	belongs_to :position
end
