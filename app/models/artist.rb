class Artist < ActiveRecord::Base
  attr_accessible :name, :url

  has_many :songs
  has_many :albums, :through => :songs

  validates_presence_of :name
end
