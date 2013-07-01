require 'spec_helper'

describe Artist do
  
  subject(:artist) { Artist.new(name: 'Radiohead', url: 'radiohead.com')}

  describe 'validations' do
    it 'requires a name' do
      expect(subject).to be_valid
      subject.name = nil
      expect(subject).to be_invalid
    end
  end

  describe 'associations' do 
    it 'has albums' do
      expect(subject).to respond_to :albums
    end

    it 'has songs' do 
      expect(subject).to respond_to :songs
    end
  end
end
