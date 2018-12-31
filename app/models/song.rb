class Song < ActiveRecord::Base
	validates_presence_of :song_name, message: "Song title can't be blank."
  	validates_uniqueness_of :song_name, message: 'Song title is already on the list.'
	
	def self.list
		Song.all
	end

	# def self.add(title) - mula2
	# 	song = Song.create(song_name: title)
	# 	if song.valid?
 #      		puts "Adding to your song list..."
 #    	else
 #       		puts "ERROR : Song #{title} already exists."
 #    	end
	# end

	def self.add(title, played_status)
		song = Song.create(song_name: title, played_status: played_status)
		if song.valid?
      		puts "Adding to your song list..."
    	else
       		puts "ERROR : Song #{title} already exists."
    	end
	end


	def self.remove(song_id)
		song = Song.find(song_id)
		song.destroy
	end

	def self.update(song_id, title, played_status)
		update_song = Song.find(song_id)
		update_song.update(song_name: title)
		update_song.update(played_status: played_status)
	end

end