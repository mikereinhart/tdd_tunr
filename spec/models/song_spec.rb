require 'spec_helper'

describe Song do
  
  subject(:song) {create :song}

  describe 'validation' do
    it 'requires a name' do
      expect(subject).to be_valid
      subject.name = nil
      expect(subject).to be_invalid
    end
  end

  describe 'association' do
    it 'has an artist' do 
      expect(subject).to respond_to :artist
    end

    it 'has an album' do 
      expect(subject).to respond_to(:album)
    end

    it 'has a genre' do
      expect(subject).to respond_to(:genre)
    end
  end

end
