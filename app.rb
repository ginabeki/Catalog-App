require_relative 'utilities/game_utility'
# App is responsible for holding the logic for our app UI
require './classes/book_label'

class App

  include GameUtility

  def initialize
    @book_label = BookLabel.new
  end


  # menu_list provides a list of different options a user can select from
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
    cases = menu_cases
    loop do
      menu_list
      selection = input
      method = cases[selection]
      if method == :exit
        puts 'Thanks for using this app'
        @book_label.save_books_data
        @book_label.save_labels_data
        break
      end
      send(method)
    end
  end

  def menu_cases
    {
      1 => :list_books,
      2 => :list_music_albums,
      3 => :list_games,
      4 => :list_genres,
      5 => :list_labels,
      6 => :list_authors,
      7 => :add_book,
      8 => :add_music_album,
      9 => :add_game,
      10 => :exit
    }
  end

  # ask user for input
  # @return the input
  def input
    gets.chomp.to_i
  end

  def list_books
    @book_label.list_books
  end

  def list_labels
    @book_label.list_labels
  end

  def add_book
    @book_label.add_book
  end

  def save_books_data
    @book_label.save_books_data
  end

  def save_labels_data
    @book_label.save_labels_data
  end
end
