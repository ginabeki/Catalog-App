require_relative 'item'
require 'json'

class Book < Item
  attr_reader :id, :publisher, :cover_state
  attr_accessor :label

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @id = Random.rand(10_000)
    @publisher = publisher
    @cover_state = cover_state
  end

  # @return boolean
  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
