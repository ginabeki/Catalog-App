require_relative '../classes/author'

##
# This module contains utlity methods for the user to
# Add author
# List author
module AuthorUtility
  @authors = []
  class << self
    attr_accessor :authors
  end

  # Utility method to add author in array
  def add_author
    return unless ask_to_add_author

    authors = AuthorUtility.authors
    first_name = ask_question('What is your first name')
    last_name = ask_question('What is your last name')
    authors << Author.new(first_name, last_name)
    authors
  end

  # Utility method to ask user if he wants to add an author
  # @return true or false
  def ask_to_add_author
    response = ask_question('Do you want to add author? Y or N?')
    until %w[y n].include? response.downcase
      response = ask_question("Wrong answer! try again
IDo you want to add author? Y or N?")
    end
    response.downcase == 'y'
  end

  # Utility method to list authors
  def list_authors
    AuthorUtility.authors.each do |author|
      puts "First Name: #{author.first_name}, Last Name: #{author.last_name}"
    end
  end
end
