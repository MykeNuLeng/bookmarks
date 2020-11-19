require 'sinatra'
require './lib/list'
class Bookmark < Sinatra::Base
  enable :sessions, :method_override

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

  get '/bookmarks/edit/:id' do
    @bookmark_id = params[:id]
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/edit/:id' do
    List.update(id: params[:id], url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  run if app_file == $0
end
