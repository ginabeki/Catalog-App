require './classes/music_album'
require 'date'

describe MusicAlbum do
  context 'should create a music album' do
    album = MusicAlbum.new('2000-10-16', true)
    it 'should be an instance of MusicAlbum' do
      expect(album).to be_an_instance_of MusicAlbum
    end
    it 'should have a publish date' do
      expect(album.publish_date).to eq Date.parse('2000-10-16')
    end
  end
end
