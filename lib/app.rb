require 'sinatra/base'
require_relative 'bookmark'
require 'sinatra/flash'

class BookmarkApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/bookmarks' do
    "#{flash[:success]}"
    @bookmarks = BookmarkManager.all.to_a
    erb :bookmarks
  end

  post '/add' do
    BookmarkManager.add(params[:url])
    flash[:success] = "You sucessfully added #{params[:url]}"
    redirect '/bookmarks'
  end
end
