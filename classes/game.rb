require_relative 'item'
require 'date'

##
# Game class takes 2 arguments
# @param multiplayer can two or more players play this game.
# @param last_played_at define last time the game was played.
# @param publish_date the date at which the game was published
# @param archived (optional) to state if the game was already archived or not

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date, archived: false)
    super(publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    super && get_number_of_years(@last_played_at) > 2
  end

  # Utility function that returns number of years between current date and the date given as param
  # @param date : is the date passed in to calculate the difference of years
  def get_number_of_years(date)
    (Date.today - Date.parse(date)).to_i / 365
  end
end
