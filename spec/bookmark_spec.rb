describe Bookmark do
  describe '.new' do
    it 'accepts three arguments at init' do
      expect{described_class.new('google', 'http://www.google.com', 1)}.not_to raise_error
    end
  end
end
