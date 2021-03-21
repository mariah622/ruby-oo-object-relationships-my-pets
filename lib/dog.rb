class Dog
  attr_reader :name
  attr_accessor :owner, :mood
  @@all = []
  
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    save

  end 
  # code goes here

  def save
    self.class.all << self
  end 

  def self.all
    @@all 
  end
end
#rspec spec/03_dog_spec.rb