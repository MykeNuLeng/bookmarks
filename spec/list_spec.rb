require 'list'

describe '.all' do
  it 'returns a list of bookmarks' do
    bookmarks = List.all

    expect(bookmarks).to include "http://www.makersacademy.com"
    expect(bookmarks).to include "http://www.destroyallsoftware.com"
    expect(bookmarks).to include "http://www.google.com"
  end
end
