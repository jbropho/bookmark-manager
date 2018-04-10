module Database
  def self.database_connection
    ENV['RACK_ENV'] == 'test' ?
    {:dbname => 'bookmark_manager_test'} : {:dbname => 'bookmark_manager'}
  end
end
