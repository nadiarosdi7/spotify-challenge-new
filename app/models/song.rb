class Song < ActiveRecord::Base
	validates_presence_of :song_name, message: "Song title can't be blank."
	validates_presence_of :played_status, message: "Yes or No.", on: :create
  	validates_uniqueness_of :song_name, message: 'Song title is already on the list.', on: :create
	
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
       		puts "ERROR : Song #{title} already exists or played_status is blank."
    	end
	end


	def self.remove(song_id)
		# song = Song.find(song_id) - mula
		songs = Song.all
		song = songs[song_id.to_i - 1]
		song.destroy
	end

	# def self.ammend(song_id, title, played_status)
	# 	songs = Songs.all
	# 	song  = songs[song_id.to_i - 1]
	# 	song.update(song_name: title, played_status: played_status)
	# end

	def self.sort
		songs = Song.all
		song_order = songs.order(:played_status)
		index = 1

		song_order.each do |song| 
		puts index.to_s.ljust(5)+ "#{song.song_name}".ljust(30) + "#{song.played_status}".rjust(5)
		index +=1
		end
	end

end