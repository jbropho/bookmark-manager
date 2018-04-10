describe BookMapper::Loader do
  describe '.create' do
    it 'creates a bookmark instance' do
      expect(BookMapper::Loader::create(\
       {:title => 'example', :url => 'www.google.com'})).to be_a Bookmark
     end
   end
end
