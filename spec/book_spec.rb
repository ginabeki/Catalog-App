require './spec/spec_helper'
describe Book do
    before :all do
      @book = Book.new('Literature', 'good', 12/10/2022)
    end

    describe '#new' do
        it 'takes in three parameters and returns a book object' do
          expect(@book).to be_an_instance_of Book
        end
    end

    

end