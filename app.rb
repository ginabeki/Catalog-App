# App is responsible for holding the logic for our app UI
require './classes/handle_musicalbum'
class App
  # menu_list provides a list of different options a user can select from
  def initialize
    @handle_musicalbum = HandleMusicAlbum.new
  end

  def menu_list
    puts "\nWelcome to our Catalog app"
    puts "Please choose options below:
  1. List all books
  2. List all music albums
  3. List of games
  4. List all genres (e.g 'Comedy', 'Thriller')
  5. List all labels (e.g. 'Gift', 'New')
  6. List all authors (e.g. 'Stephen King')
  7. Add a book
  8. Add a music album
  9. Add a game
 10. Exit"
  end

  # this method calls specifc method depending on the user selection
  def selection_cases
    cases = { 1 => :list_book,
              2 => :list_music_albums,
              3 => :list_games,
              4 => :list_genres,
              5 => :list_labels,
              6 => :list_authors,
              7 => :add_book,
              8 => :add_music_album,
              9 => :add_game,
              10 => :exit }

    loop do
      menu_list
      selection = input
      method = cases[selection]
      if method == :exit
        @handle_musicalbum.save_genres
        @handle_musicalbum.save_albums
        puts 'Thanks for using this app'
        break
      end
      if method == :add_music_album
        @handle_musicalbum.create_music_album
        puts 'Thanks for using this app'
        break
      end
      if method == :list_music_albums
        @handle_musicalbum.list_albums
        puts 'Thanks for using this app'
        break
      end
      if method == :list_genres
        @handle_musicalbum.list_genres
        puts 'Thanks for using this app'
        break
      end
      send(method)
    end
  end

  # ask user for input
  # @return the input
  def input
    gets.chomp.to_i
  end
end
