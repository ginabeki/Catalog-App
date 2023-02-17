require './spec/spec_helper'
require 'date'
describe Book do
  before :all do
    @book = Book.new('Literature', 'good', '2012-06-12')
  end

  describe '#new' do
    it 'takes in three parameters and returns a book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  it 'should return publisher' do
    expect(@book.publisher).to eq 'Literature'
  end

  it 'should return cover_state' do
    expect(@book.cover_state).to eq 'good'
  end

  it 'should return publish_date' do
    expect(@book.publish_date).to eq Date.parse('2012-06-12')
  end
end
