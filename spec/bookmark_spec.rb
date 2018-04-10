describe BookmarkManager do
  describe '.all' do
    it 'returns all bookmarks' do
      Database::add_test_data
      bookmarks = BookmarkManager.all.to_a
      expect(bookmarks).to include({"url"=>"http://www.github.com"})
    end
  end
end
