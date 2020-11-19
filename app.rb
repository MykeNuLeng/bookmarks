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

  post '/add' do
    List.create(url: params[:add_bookmark], title: params[:Title])
    redirect '/bookmarks'
  end

  post '/delete' do
    List.delete(title: params[:delete_bookmark])
    redirect '/bookmarks'
  end


  run if app_file == $0
end
