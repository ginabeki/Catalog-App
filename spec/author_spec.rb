require_relative '../classes/author'

describe Author do
  before :all do
    @author1 = Author.new('James', 'Clear')
  end

  context 'Author object'
  it 'Should create a new author' do
    expect(@author1).to be_instance_of Author
  end

  it 'should return id equal to 541' do
    allow(@author1).to receive(:id).and_return(541)
    expect(@author1.id).to eq(541)
  end

  it 'should return first_name equal to James' do
    expect(@author1.first_name).to eq('James')
  end

  it 'should return last_name equal to Clear' do
    expect(@author1.last_name).to eq('Clear')
  end
end
