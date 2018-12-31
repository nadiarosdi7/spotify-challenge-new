class Song < ActiveRecord::Base
	
	def self.list
		Song.all
	end

end