##
# Item class takes 6 paramters
# @genre is the categorie of item. ie: Music
# @author is the owner of item. ie: book
# @source
# @label is the title of item. ie: album
# @archived is the boolean value of item.
# @publish_date is the published date of item.
require 'date'
class Item
  attr_reader :genre, :author, :source, :label, :archived, :publish_date

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..10_000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  # add_genre adds a genre to the item
  # @param genre is the genre object
  def add_genre(genre)
    @genre = genre
  end

  # add_source adds a source to the item
  # @param source is the source object
  def add_source(source)
    @source = source
  end

  # add_label adds a label to the item
  # @param label is the label object
  def add_label(label)
    @label = label
  end

  # add_author adds an author to the item
  # @param author is the author object
  def add_author(author)
    @author = author
    author.items << self
  end

  # move_to_archive change the value of archived if the item
  # can be archived
  def move_to_archive
    @archived = true if can_be_archived
  end

  private

  def can_be_archived?
    current_year = Time.new.year
    current_year - @publish_date.year > 10
  end
end
