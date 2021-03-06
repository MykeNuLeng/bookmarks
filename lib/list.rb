require 'pg'
class List

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'bookmark_manager_test')
  else
    connection = PG.connect(dbname: 'bookmark_manager')
  end
  result = connection.exec("SELECT * FROM bookmarks")
  result.map do |bookmark|
    List.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(url: ,title:)
    if ENV['ENVIRONMENT'] != 'test'
      connection = PG.connect(dbname: 'bookmark_manager')
    else
      connection = PG.connect(dbname: 'bookmark_manager_test')
    end
    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    List.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(title:)
    if ENV['ENVIRONMENT'] != 'test'
      connection = PG.connect(dbname: 'bookmark_manager')
    else
      connection = PG.connect(dbname: 'bookmark_manager_test')
    end
    connection.exec("DELETE FROM bookmarks WHERE title = '#{title}'")
  end

  def self.update(id:, url:, title:)
    if ENV['ENVIRONMENT'] != 'test'
      connection = PG.connect(dbname: 'bookmark_manager')
    else
      connection = PG.connect(dbname: 'bookmark_manager_test')
    end
    result = connection.exec("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, title, url;")
    List.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end
end
