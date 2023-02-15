##
# Class Author define an author of specific item
# @param first_name is the first name of the author
# @param last_name is the last name of the author

class Author
  attr_accessor :first_name, :last_name
  attr_reader :items, :id

  def initialize(first_name, last_name)
    @id = Random.rand(1..10_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  # Add specific item to the current author
  # An author can have many items
  def add_item(item)
    @items.push(item)
    item.author = self
  end
end