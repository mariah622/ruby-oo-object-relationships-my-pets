class Cat
  attr_reader :name
  attr_accessor :owner, :mood

  @@all = []

  def initialize(name, owner, mood = "nervous")
    @mood = mood 
    @name = name
    @owner = owner
    save
  end 
  
  def save
    self.class.all << self
  end 

  def self.all
    @@all
  end 

  # code goes here
end

#rspec spec/02_cat_spec.rb