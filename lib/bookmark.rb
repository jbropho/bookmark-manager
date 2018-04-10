require 'pry'
require_relative'helper'

class Bookmark
   def self.all
     execute 'SELECT url FROM bookmarks'
   end

   def self.add(url)
     raise "#{url} is not a valid url" unless self.valid_url?(url)
     execute('INSERT INTO bookmarks (url) VALUES ($1)', [url])
   end

   private
   def self.execute(request)
     connect
     result = @conn.exec(request)
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
