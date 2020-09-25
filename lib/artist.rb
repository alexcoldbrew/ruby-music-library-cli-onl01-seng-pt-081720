class Artist
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
  
  def self.create(artist)
    new_artist = self.new(artist)
    new_artist.save
    new_artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
    else
      nil
    end
    if @songs.include?(song)
      nil
    else
      @songs << song
    end
    song
  end
  
  def genres
    @array = []
    @songs.each do |song|
      if @array.include?(song.genre)
        nil
      else
        @array << song.genre
      end
    end
    @array
  end
  
end