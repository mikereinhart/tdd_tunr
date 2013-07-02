class Song < ActiveRecord::Base
  attr_accessible :album_id, :artist_id, :name

  belongs_to :artist
  belongs_to :album
  has_and_belongs_to_many :genres

  validates_presence_of :name
end
