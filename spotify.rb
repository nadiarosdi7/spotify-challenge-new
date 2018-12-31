# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'
require 'active_record'



# Your Code begins from this line onwards #



# def self.display_menu
	puts "*" * 30
	puts "Please enter your options | guideline as below: "
	puts "ruby spotify.rb list                                     # List all the songs"
    puts "ruby spotify.rb add <Song Name> <Played Status>          # e.g. ruby spotify.rb 'Uptown Girl' 'No' "
    puts "ruby spotify.rb update <No.> <Song Name> <Played Status> # e.g. ruby spotify.rb 1 'Sugar' 'Yes' "
    puts "ruby spotify.rb remove <No.>                             # e.g. ruby spotify.rb 1 "
    puts "ruby spotify.rb sort                                     # Sort all songs according to Played Status"
    puts "*" * 30	
   
# end

def display_list
	songs = Song.list



	if songs.empty?
		puts "You have no song. Kindly add"
	else
		songs.each_with_index { |song, index| puts "#{index+1}".ljust(5)+ "#{song.song_name}".ljust(30) + "#{song.played_status}".rjust(5)}
	end
	
end

# def add_list(title) - mula2
# 	Song.add title
# end

def add_list(title, played_status)
	Song.add title, played_status
end


def remove_list(song_id)
	Song.remove song_id
end

def update_list(song_id, title, played_status)
	Song.update song_id, title, played_status
end

def sort_list
	Song.sort
end



if ARGV[0] == "list"
	puts "listing all songs..."
	display_list
elsif ARGV[0] == "add"
	# puts "adding song..."
	# add_list ARGV[1..-1] - mula2
	add_list ARGV[1], ARGV[2]

elsif ARGV[0] == "update"
	puts "updating song name or played status..."
	update_list ARGV[1], ARGV[2], ARGV[3]
elsif ARGV[0] == "remove"
	puts "deleting a song..."
	remove_list ARGV[1]
elsif ARGV[0] == "sort"
	puts "sorting all songs..."
	sort_list

else
	puts "Invalid entry. Kindly enter a valid entry"
end




