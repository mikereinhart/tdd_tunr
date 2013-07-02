class User < ActiveRecord::Base
  attr_accessible :email, :name, :password

  validates_presence_of :name
  validates_presence_of :password
  validates_presence_of :email

  has_and_belongs_to_many :albums

  def purchase(album)
    # if the album is not in the users albums, purchase it
    # if it is already owned by the user, block the purchase
    unless albums.include? album
      albums << album
    end
  end

  def forget_albums
    self.albums = []
    self.save
  end
end
