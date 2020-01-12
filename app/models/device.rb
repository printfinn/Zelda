class Device < ApplicationRecord
	validates :device_name, presence: true	
end
