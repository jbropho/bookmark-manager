module Database
  require 'pg'
  def self.database_connection
    ENV['RACK_ENV'] == 'test' ?
    {:dbname => 'bookmark_manager_test'} : {:dbname => 'bookmark_manager'}
  end

  def self.add_test_data
    conn = PG::Connection.open(self.database_connection)
    conn.exec_params("INSERT INTO bookmarks (url) VALUES ('http://www.github.com')")
  end
end
