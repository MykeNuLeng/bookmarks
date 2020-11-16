require 'sinatra'
require './lib/list'
class Bookmark < Sinatra::Base

  before do
    @list = List.instance
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @list = List.create
    erb :bookmarks
  end


  run if app_file == $0
end
