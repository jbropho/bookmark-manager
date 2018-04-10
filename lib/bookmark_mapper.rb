module BookMapper
  require_relative 'bookmark'

  module Loader
    def self.create(data)
      Bookmark.new(data["title"], data["url"])
    end
  end
end
