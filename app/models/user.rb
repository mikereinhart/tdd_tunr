class User < ActiveRecord::Base
  attr_accessible :email, :name, :password

  validates_presence_of :name
  validates_presence_of :password

  has_and_belongs_to_many :albums

  def purchase(album)
    albums << album
  end


end
