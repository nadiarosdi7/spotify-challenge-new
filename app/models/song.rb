class Song < ActiveRecord::Base
	
	def self.list
		Song.all
	end

	def self.add(sentence)
		song = Song.create(song_name: sentence)
	end
end