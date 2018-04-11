require 'comment'

describe Comment do
  describe '.new' do
    it 'accepts two arguments on init' do
      expect{described_class.new(1, 'test')}.not_to raise_error 
    end
  end
end
