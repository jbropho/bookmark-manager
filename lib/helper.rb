module Database
  def self.database_connection
    ENV['RACK_ENV'] == 'test' ?
    {:dbname => 'bookmark_manager_test'} : {:dbname => 'bookmark_manager'}
  end

  def self.add_test_data
    conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
    conn.exec_params("INSERT INTO bookmarks (url) VALUES ('http://www.github.com')")
  end
end
