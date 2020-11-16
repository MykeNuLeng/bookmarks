require 'list'


describe List do
   it 'returns a list' do
     expect(subject.bookmarks).to be_an_instance_of Array
   end

   it 'lists the list from lists lists' do
     expect(subject.list_of_bookmarks).to be_an_instance_of String
   end

   it 'lists bookmarks' do
     expect(subject.bookmarks).to include "Not porn"
   end
end

describe '.all' do
  it 'returns a list of bookmarks' do
    bookmarks = List.all

    expect(bookmarks).to include "http://www.makersacademy.com"
    expect(bookmarks).to include "http://www.destroyallsoftware.com"
    expect(bookmarks).to include "http://www.google.com"
  end
end
