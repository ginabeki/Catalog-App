require './classes/genre'
require './classes/item'

describe Genre do
  context 'It should create a genre' do
    genre = Genre.new(1, 'pop')
    it 'should create a new genre' do
      expect(genre.name).to eq 'pop'
    end
  end
end
