class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :artist, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(genre)
    new_genre = self.new(genre)
    new_genre.save
    new_genre
  end
  
  def songs
    @songs
  end
  
  def artists
    @array = []
    @songs.each do |song|
      if @array.include?(song.artist)
        nil
      else
        @array << song.artist
      end
    end
    @array
  end
  
end