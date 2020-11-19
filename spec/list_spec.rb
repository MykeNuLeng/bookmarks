require 'list'
require 'database_helpers'
describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy All Software');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google');")

    bookmarks = List.all.map { |bookmark| bookmark.title }

    expect(bookmarks).to include "Makers Academy"
    expect(bookmarks).to include "Destroy All Software"
    expect(bookmarks).to include "Google"
  end
end

describe '.create' do
  it 'creates a new bookmark' do
    bookmark = List.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
    persisted_data = persisted_data(id: bookmark.id)

    expect(bookmark).to be_a List
    expect(bookmark.id).to eq persisted_data['id']
    expect(bookmark.title).to eq 'Test Bookmark'
    expect(bookmark.url).to eq 'http://www.testbookmark.com'
  end
end

describe '.delete' do
  it 'deletes a bookmark' do
    List.create(url: 'http://www.google.com', title: 'Google')
    List.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
    List.delete(title: 'Test Bookmark')
    bookmarks = List.all.map { |bookmark| bookmark.title }
    expect(bookmarks).not_to include 'Test Bookmark'
  end
end
