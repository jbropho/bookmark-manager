require 'sinatra/base'
require_relative 'bookmark'

class BookmarkApp < Sinatra::Base

  get '/bookmarks' do
    @bookmarks = Bookmark.all.to_a
    erb :bookmarks
  end
end
