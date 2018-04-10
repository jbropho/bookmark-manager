require 'sinatra/base'
require_relative 'bookmark'
require 'sinatra/flash'

class BookmarkApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/bookmarks' do
    "#{flash[:success]}"
    @bookmarks = Bookmark.all.to_a
    erb :bookmarks
  end

  post '/add' do
    Bookmark.add(params[:url])
    flash[:success] = "You sucessfully added #{params[:url]}"
    redirect '/bookmarks'
  end
end
