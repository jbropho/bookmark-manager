require 'pg'
require 'pry'
require_relative'helper'

class Bookmark
   def self.all
     conn = PG::Connection.open(Database::database_connection)
     res = conn.exec_params('SELECT url FROM bookmarks')
     res
   end

   def self.add(url)
     conn = PG::Connection.open(Database::database_connection)
     res = conn.exec_params('INSERT INTO bookmarks (url) VALUES ($1)', [url])
     res
   end
end
