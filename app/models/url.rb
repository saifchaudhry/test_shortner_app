class Url < ApplicationRecord
	require 'uri'
	validate :valid_actual_url?
	
	def valid_actual_url?
		uri = URI.parse(actual_url)
	  errors.add(:actual_url, "Url is incorrect") unless uri && uri.host
	rescue URI::InvalidURIError
	  errors.add(:actual_url, "Url is incorrect")
	end
end
