require_relative 'helper'
require_relative 'bookmark_mapper'
require 'pry'

class BookmarkManager

   def self.join_search(id)
     execute('SELECT * FROM bookmarks LEFT OUTER JOIN comments ON' +
       '(bookmarks.id = comments.bookmark_id) WHERE bookmarks.id=$1', [id])
   end

   def self.all_objects
     results = execute('SELECT * FROM bookmarks').to_a
     results.map! { |result| BookMapper::Loader::create(result) }
   end

   def self.update(id, title, url)
      execute('UPDATE bookmarks SET url = $1, title = $2 WHERE id=$3', [url, title, id])
   end

   def self.find(id)
     results = execute('SELECT * FROM bookmarks WHERE id=$1', [id]).to_a
     BookMapper::Loader::create(results[0])
   end

   def self.add(url, title)
     raise "#{url} is not a valid url" unless self.valid_url?(url)
     execute('INSERT INTO bookmarks (url, title) VALUES ($1, $2)', [url, title])
   end

   def self.delete(id)
     execute('DELETE FROM bookmarks WHERE id=$1', [id])
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
