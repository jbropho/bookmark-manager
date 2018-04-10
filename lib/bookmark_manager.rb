require_relative 'helper'
require_relative 'bookmark_mapper'
require 'pry'

class BookmarkManager
   def self.all
     execute 'SELECT url FROM bookmarks'
   end

   def self.all_objects
     results = execute('SELECT * FROM bookmarks').to_a
     results.map! { |result| BookMapper::Loader::create(result) }
   end

   def self.add(url, title)
     raise "#{url} is not a valid url" unless self.valid_url?(url)
     execute('INSERT INTO bookmarks (url, title) VALUES ($1, $2)', [url, title])
   end

   private
   def self.execute(request, params = [])
     connect
     result = @conn.exec(request, params)
     close
     result
   end

   def self.connect
     @conn = PG::Connection.open(Database::database_connection)
   end

   def self.close
     @conn.close
   end

   def self.valid_url?(url)
    !!(url.match(/https*\:\/\/[\w\.\-]{5,}\.[a-z]+/))
   end
end
