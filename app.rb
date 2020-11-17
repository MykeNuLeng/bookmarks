require 'sinatra'
require './lib/list'
class Bookmark < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @list = List.all
    erb :bookmarks
  end


  run if app_file == $0
end
