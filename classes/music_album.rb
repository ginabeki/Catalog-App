require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :archived
  attr_reader :publish_date

  def initialize(publish_date, _on_spotify)
    super(publish_date)
    @on_spotify = on_spotifys
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
