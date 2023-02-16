require_relative '../classes/author'
require 'fileutils'
require 'json'

FileUtils.mkdir_p('json_data')
base = "#{Dir.pwd}/json_data"
File.open("#{base}/authors.json", 'w') unless File.exist?("#{base}/authors.json")

##
# This module contains utlity methods for the user to
# Add author
# List author
module AuthorUtility
  base = "#{Dir.pwd}/json_data"
  authors_reader = File.read("#{base}/authors.json")
  @authors = []

  unless authors_reader == ''
    JSON.parse(authors_reader).each do |x|
      @authors.push(Author.new(x['first_name'], x['last_name']))
    end
  end

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

  # Persist data to JSON
  def write_authors
    authors = AuthorUtility.authors
    base = "#{Dir.pwd}/json_data"
    empty_array = []
    authors&.each do |e|
      empty_array << { first_name: e.first_name, last_name: e.last_name }
    end
    File.write("#{base}/authors.json", empty_array.to_json, mode: 'w')
  end
end
