require 'pg'
class List
  attr_reader :bookmarks

  def self.create
    @list = List.new
  end

  def self.all
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.instance
    @list
  end

  def initialize
    @bookmarks = ["Not porn"]
  end

  def list_of_bookmarks
    @bookmarks.join(", ")
  end
end
