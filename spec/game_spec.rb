require_relative '../classes/game'

describe Game do
  before :all do
    @game1 = Game.new(true, '2023/02/15', '2020/11/07')
  end

  context 'game object'
  it 'Should create a new game' do
    expect(@game1).to be_instance_of Game
  end

  it 'should return be a multiplayer game' do
    expect(@game1.multiplayer).to be_truthy
  end

  it 'should return last played at 2023/02/15' do
    expect(@game1.last_played_at).to eq('2023/02/15')
  end

  it 'should return publish date of 2020/11/07' do
    expect(@game1.publish_date).to eq('2020/11/07')
  end
end
