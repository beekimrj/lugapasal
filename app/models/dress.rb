class Dress < ApplicationRecord
	has_one_attached :dress_img
	validate :acceptable_image

	def acceptable_image
		return unless dress_img.attached?
		acceptable_types = ["image/jpeg","image/png"]
		unless acceptable_types.include?(dress_img.content_type)
    errors.add(:dress_img, "must be a JPEG or PNG")
  	end
	end

end
