require_relative '../classes/game'
require_relative '../app'
require_relative 'author_utility'
require 'date'
require 'fileutils'
require 'json'

FileUtils.mkdir_p('json_data')
base = "#{Dir.pwd}/json_data"
File.open("#{base}/games.json", 'w') unless File.exist?("#{base}/games.json")

##
# This module contains utlity methods for the user to
# Create games
# List Games
# Write Games
module GameUtility
  include AuthorUtility
  @games = []
  class << self
    attr_accessor :games
  end
  # Asks user if the game is
  # a multiplayer game? Expected result : true or false
  # when was the last time played? Expected result : Date. ie: 2022/01/01
  # When the game got published? Expected result : Date. ie: 2019-05-02
  def add_game
    games = GameUtility.games
    multiplayer = check_multiplayer(
      ask_question('Is it a multiplayer game? Y or N?')
    )
    last_played_at = check_last_played_at(
      ask_question('When was the last time you played the game. Enter a date format. hint : 2023/02/15')
    )
    publish_date = check_publish_date(
      ask_question('When was the game published?. Hint : 2010/01/01')
    )
    new_author = add_author
    new_game = Game.new(multiplayer, last_played_at, publish_date)
    new_game.add_author(new_author) if new_author.instance_of?(Item)
    games.push(new_game)
    puts "Variable games #{games}"
  end

  # Checks if the user typed the correct input
  # Expect to get 'y' or 'n' as an answer
  def check_multiplayer(response)
    until %w[y n].include? response.downcase
      response = ask_question("Wrong answer! try again
Is it a multiplayer game? Y or N?")
    end
    response.downcase == 'y'
  end

  # Checks if the user typed the correct date format
  def check_publish_date(response)
    until valid_date?(response)
      response = ask_question("Wrong Format!\nWhen was the game published?. Hint : 2010/01/01")
    end
    response
  end

  # Checks if the user typed the correct date format
  def check_last_played_at(response)
    not_valid = 'Date Not Valid'
    result = convert_date(response)
    while result == not_valid
      response = ask_question("Wrong Format ! try again.
When was the last time you played the game.Enter a date format. hint : 2023/02/15")
      result = convert_date(response)
    end
    result
  end

  # list games
  def list_games
    GameUtility.games.each do |game|
      puts "Multiplayer: #{game.multiplayer}, Last Played: #{game.last_played_at}"
    end
  end

  # Persist data to JSON
  def write_games
    games = GameUtility.games
    base = "#{Dir.pwd}/json_data"
    empty_array = []
    games&.each do |e|
      empty_array << { multiplayer: e.multiplayer, last_played_at: e.last_played_at, publish_date: e.publish_date }
    end
    File.write("#{base}/games.json", empty_array.to_json, mode: 'w')
  end

  # Utility method to convert the input string into Date format
  # @param response the string value
  # @returns parsed date or an error message 'Date not Valid'
  def convert_date(response)
    Date.parse(response)
  rescue ArgumentError
    'Date Not Valid'
  end

  # utility method to check if it's a valid date or not
  # returns boolean true or false
  def valid_date?(date)
    date_format = '%Y/%m/%d'
    DateTime.strptime(date, date_format)
    true
  rescue ArgumentError
    false
  end

  # Utility method to ask a question to user and returns the input
  def ask_question(question)
    puts question
    gets.chomp
  end
end
