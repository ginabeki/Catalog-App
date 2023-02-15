# App is responsible for holding the logic for our app UI
require './classes/book'
require './classes/label'

class App
  attr_reader :books, :labels

  def initialize
    @books = []
    @labels = []
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
        save_books_data
        save_labels_data
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
    if @books.empty?
      puts 'No book found, you can add one by typing option 7.'
      return
    end
    @books.each do |book|
      puts "Publisher: #{book.publisher}, Cover_State: #{book.cover_state}, Publish_Date: #{book.publish_date}"
    end
  end

  def list_labels
    if @labels.empty?
      puts 'No label found!'
      return
    end
    @labels.each { |label| puts "Title: #{label.title}, Color: #{label.color}" }
  end

  def add_book
    print 'Title of the book: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state: '
    cover_state = gets.chomp
    print 'Publication date (yyyy-mm-dd): '
    publish_date = gets.chomp
    book = Book.new(publisher, cover_state, publish_date)
    label = Label.new(title, color)
    label.add_item(book)

    @books << book
    @labels << label
    puts "Book added with id: #{book.id}"
  end

  def save_books_data
    if @books.empty?
      puts 'There are no books to save'
      return
    end
    if File.file?('data/book.json')
      existing_books = JSON.parse(File.read('data/book.json'), symbolize_names: true)
      last_book = existing_books.last
      last_book_id = last_book[:ID]
      new_books = @books.map do |book|
        {
          ID: last_book_id + book.id,
          Publisher: book.publisher,
          Cover_State: book.cover_state,
          Publish_Date: book.publish_date
        }
      end
      all_books = existing_books + new_books
    else
      all_books = @books.map do |book|
        {
          ID: book.id,
          Publisher: book.publisher,
          Cover_State: book.cover_state,
          Publish_Date: book.publish_date
        }
      end
    end
    File.write('data/book.json', JSON.pretty_generate(all_books))
    puts 'Books data saved successfully'
  end

  def save_labels_data
    if @labels.empty?
      puts 'There are no labels to save'
      return
    end

    filename = 'data/label.json'
    existing_data = File.exist?(filename) ? JSON.parse(File.read(filename)) : []

    labels_hash = @labels.map(&:to_custom_hash)

    merged_data = existing_data.concat(labels_hash).uniq { |label| [label['Title'], label['Color']] }

    File.write(filename, JSON.pretty_generate(merged_data))
    puts 'Labels data saved successfully'
  end
end
