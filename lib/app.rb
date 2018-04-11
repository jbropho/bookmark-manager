require 'sinatra/base'
require_relative 'bookmark_manager'
require 'sinatra/flash'
require 'pry'

class BookmarkApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/bookmarks' do
    "#{flash[:success]}"
    @bookmarks = BookmarkManager.all_objects
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
end
