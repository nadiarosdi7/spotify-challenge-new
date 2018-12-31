require 'faker'

3.times do 
	Song.create :song_name => Faker::Lorem.sentence
end





