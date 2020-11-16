require 'list'

describe List do
   it 'returns a list' do
     expect(subject.bookmarks).to be_an_instance_of Array
   end

   it 'lists the list from lists lists' do
     expect(subject.list_of_bookmarks).to be_an_instance_of String
   end
end
