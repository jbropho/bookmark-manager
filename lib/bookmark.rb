class Bookmark
  attr_reader :title, :url, :id, :comments
  def initialize(title, url, id, comments = [])
    @title = title
    @url = url
    @id = id
    @comments = comments
  end
end
