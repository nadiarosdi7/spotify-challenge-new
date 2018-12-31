# 31122018112300_create_songs.rb

class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
       t.string  :song_name
       t.string  :played_status
       
       t.timestamps
    end
  end
end
