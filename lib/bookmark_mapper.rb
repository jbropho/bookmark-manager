module BookMapper
  require_relative 'bookmark'
  require_relative 'comment'
  module Loader
    def self.create(data)
      Bookmark.new(data["title"], data["url"], data["id"])
    end

    def self.parse_results(data)
      objects = Array.new
      with_bookmark = add_bookmark_id(data)
      grouped = group_by_id(with_bookmark)
      grouped.each { |result| objects << create_objects(result) }
      return objects
    end

    def self.create_objects(result)
      data = result[1..-1].flatten!
      comments = create_comments(data)
      Bookmark.new(data[0]['title'], data[0]['url'], data[0]['bookmark_id'], comments)
    end

    def self.create_comments(data)
      comments = Array.new
      data.each { |hash| comments << Comment.new(hash["id"], hash["text"]) if hash['id']}
      return comments
    end

    def self.group_by_id(data)
      data.group_by { |hash| hash['bookmark_id'] }
    end

    def self.add_bookmark_id(data)
      id = data.column_values(0)
      json_objects = data.to_a

      id.each_with_index { |id, idx| json_objects[idx]["bookmark_id"] = id }
      return json_objects
    end
  end
end
