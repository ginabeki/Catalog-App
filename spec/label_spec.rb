require './spec/spec_helper'
require 'date'
describe Label do
  before :all do
    @label = Label.new('Vampire Diaries', 'red')
  end

  describe '#new' do
    it 'takes in three parameters and returns a book object' do
      expect(@label).to be_an_instance_of Label
    end
  end

  it 'should return title' do
    expect(@label.title).to eq 'Vampire Diaries'
  end

  it 'should return cover_state' do
    expect(@label.color).to eq 'red'
  end

end
