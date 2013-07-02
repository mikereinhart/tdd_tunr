require 'spec_helper'

describe User do

  subject(:user) {User.create(name: 'Mike', email: 'mike@sample.com', password: 'password')}
  
  describe 'validations' do
    it 'requires a name' do 
      expect(subject).to be_valid
      subject.name = nil
      expect(subject).to be_invalid
    end

    it 'requires a password' do 
      expect(subject).to be_valid
      subject.password = nil
      expect(subject).to be_invalid
    end

    it 'requires an email' do
      expect(subject).to be_valid
      subject.email = nil
      expect(subject).to be_invalid
    end
  end

  describe 'associations' do 
    it 'has albums' do 
      expect(subject).to respond_to(:albums)
    end
  end

  describe '#purchase' do
    context 'for new album' do
      it 'adds an album to collection' do
        album = create(:album)
        lambda {
          subject.purchase(album)
        }.should change{user.albums.size}.by 1
        user.albums.should eq [album]
      end
    end

    context 'for existing album' do
      it 'does not add album to collection' do 
        album = create(:album)
        lambda {
          subject.purchase(album)
        }.should change{user.albums.size}.by 1
        lambda {
          subject.purchase(album)
        }.should change{user.albums.size}.by 0
        user.albums.should eq [album]
      end
    end
  end

  describe '#forget_albums' do
    it 'clears the users albums' do
      album = create(:album)
      subject.purchase(album)
      subject.albums.should eq [album]
      subject.forget_albums
      subject.albums.should eq []
    end
  end

end
