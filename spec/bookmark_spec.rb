require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all.to_a
      expect(bookmarks).to include({"url"=>"http://www.github.com"})
    end
  end
end
