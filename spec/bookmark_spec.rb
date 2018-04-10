describe Bookmark do
  describe '.new' do
    it 'accepts two arguments at init' do
      expect{described_class.new('google', 'http://www.google.com')}.not_to raise_error
    end
  end
end
