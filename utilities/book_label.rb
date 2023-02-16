require_relative '../classes/book'
require_relative '../classes/label'

module BookLabel
  @books = []
  @labels = []
  class << self
    attr_accessor :books, :labels
  end

  def list_books
    if BookLabel.books.empty?
      puts 'No book found, you can add one by typing option 7.'
      return
    end
    BookLabel.books.each do |book|
      puts "Publisher: #{book.publisher}, Cover_State: #{book.cover_state}, Publish_Date: #{book.publish_date}"
    end
  end

  def list_labels
    if BookLabel.labels.empty?
      puts 'No label found!'
      return
    end
    BookLabel.labels.each { |label| puts "Title: #{label.title}, Color: #{label.color}" }
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

    BookLabel.books << book
    BookLabel.labels << label
    puts "Book added with id: #{book.id}"
  end

  def save_books_data
    if File.file?('json_data/book.json')
      existing_books = JSON.parse(File.read('json_data/book.json'), symbolize_names: true)
      last_book = existing_books.last
      last_book_id = last_book[:ID]
      new_books = BookLabel.books.map do |book|
        {
          ID: last_book_id + book.id,
          Publisher: book.publisher,
          Cover_State: book.cover_state,
          Publish_Date: book.publish_date
        }
      end
      all_books = existing_books + new_books
    else
      all_books = BookLabel.books.map do |book|
        {
          ID: book.id,
          Publisher: book.publisher,
          Cover_State: book.cover_state,
          Publish_Date: book.publish_date
        }
      end
    end
    File.write('json_data/book.json', JSON.pretty_generate(all_books))
  end

  def save_labels_data
    filename = 'json_data/label.json'
    existing_data = File.exist?(filename) ? JSON.parse(File.read(filename)) : []

    labels_hash = BookLabel.labels.map(&:to_custom_hash)

    merged_data = existing_data.concat(labels_hash).uniq { |label| [label['Title'], label['Color']] }

    File.write(filename, JSON.pretty_generate(merged_data))
  end
end
