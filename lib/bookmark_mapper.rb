module BookMapper
  require_relative 'bookmark'

  module Loader
    def self.create(data)
      Bookmark.new(data["title"], data["url"], data["id"])
    end
  end
end
