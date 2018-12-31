class Song < ActiveRecord::Base
	
	def self.list
		Song.all
	end

	def self.add(sentence)
		song = Song.create(song_name: sentence)
	end

	def self.remove(task_id)
		song = Song.find(task_id)
		song.destroy
	end
end