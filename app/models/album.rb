class Album < ApplicationRecord
	has_attached_file :cover, styles: { large: "500x500>", very_large: "600x600>", def: "1280x1280>"}, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
  	has_many :images, dependent: :destroy
end
