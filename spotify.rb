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
		songs.each_with_index { |item, index| puts "#{index+1}. #{item.song_name}"}
	end
	
end

def add_list(sentence)
	Song.add sentence
end

def remove_list(task_id)
	Song.remove task_id
end


if ARGV[0] == "list"
	puts "listing all songs..."
	display_list
elsif ARGV[0] == "add"
	puts "adding song..."
	add_list ARGV[1..-1]
elsif ARGV[0] == "update"
	puts "updating song name or played status..."
elsif ARGV[0] == "remove"
	puts "deleting a song..."
	remove_list ARGV[1]
elsif ARGV[0] == "sort"
	puts "sorting all songs..."
else
	puts "Invalid entry. Kindly enter a valid entry"
end




