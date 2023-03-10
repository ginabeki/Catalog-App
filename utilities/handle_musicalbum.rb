require 'json'
require 'date'
require_relative '../classes/music_album'
require_relative '../classes/genre'

module HandleMusicAlbum
  class << self
    attr_accessor :albums, :genres
  end

  # Create Music Album & Genre
  def add_music_album
    print 'Publish date of the album [Enter date in format (yyyy-mm-dd)]: '
    publish_date = gets.chomp
    return unless publish_date

    print 'Is the album on spotify? [Y/N]: '
    on_spotify = gets.chomp.downcase == 'y' || false

    HandleMusicAlbum.albums << MusicAlbum.new(publish_date, on_spotify)
    puts 'Album created successfully'

    print 'Do you want to add genre? [Y/N]: '
    perm = gets.chomp.downcase == 'y' || false
    if perm
      puts 'Please, type the genre name '
      g_name = gets.chomp
      HandleMusicAlbum.genres << Genre.new(g_name)
      puts 'Music album and Genre created successfully'
    else
      puts 'Music Album created successfully'
    end
  end

  # List Albums and Genres
  def list_music_albums
    HandleMusicAlbum.albums.each do |album|
      puts "Publish Date: #{album.publish_date}"
      puts "On Spotify: #{album.on_spotify}"
    end
  end

  def list_genres
    HandleMusicAlbum.genres.each do |genre|
      puts "\nName: #{genre.name}"
    end
  end

  # Load & Save Genres to JSON
  def self.load_genres
    if File.exist?('./json_data/genre.json') && File.read('./json_data/genre.json') != ''
      JSON.parse(File.read('./json_data/genre.json')).map do |genre|
        Genre.new(genre['name'])
      end
    else
      []
    end
  end

  def save_genres
    data = []
    HandleMusicAlbum.genres.each do |genre|
      data.push({ name: genre.name })
    end
    open('./json_data/genre.json', 'w') { |f| f << JSON.pretty_generate(data) }
  end

  # Load & Save Albums to JSON
  def self.load_albums
    if File.exist?('./json_data/album.json') && File.read('./json_data/album.json') != ''
      JSON.parse(File.read('./json_data/album.json')).map do |album|
        MusicAlbum.new(album['publish_date'], album['spotify'])
      end
    else
      []
    end
  end

  def save_albums
    data = []
    HandleMusicAlbum.albums.each do |album|
      data.push({ publish_date: album.publish_date, spotify: album.on_spotify })
    end
    open('./json_data/album.json', 'w') { |f| f << JSON.pretty_generate(data) }
  end

  @albums = load_albums
  @genres = load_genres
end
