require 'sinatra/base'
require_relative 'bookmark_manager'
require 'sinatra/flash'
require 'pry'

class BookmarkApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/thing' do
    @thing = BookmarkManager.join_search(32)
    binding.pry
  end

  get '/bookmarks' do
    "#{flash[:success]}"
    @bookmarks = BookmarkManager.all
    erb :bookmarks
  end

  post '/add' do
    BookmarkManager.add(params[:url], params[:title])
    flash[:success] = "You sucessfully added #{params[:url]}"
    redirect '/bookmarks'
  end

  post '/delete' do
    BookmarkManager.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/update' do
    @bookmark = BookmarkManager.find(params[:id])
    erb :update
  end

  post '/update' do
    BookmarkManager.update(params[:id], params[:title], params[:url])
    redirect '/bookmarks'
  end
end
