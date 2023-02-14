require_relative 'item'
class Book < Item
  attr_reader :publisher, :cover_state

  def initialize(publisher, cover_state)
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  # @return boolean
  def can_be_archived
    super || @cover_state = 'bad'
  end
end
