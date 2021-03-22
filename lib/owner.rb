class Owner
  attr_reader :name, :species
  attr_accessor :cats, :dogs

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    save
  end 

  def save
    self.class.all << self
  end 

  def self.all
    @@all 
  end 

  def say_species
    "I am a #{@species}."
  end
  
  def owners_pets(pet_class)
    pets = []
    for pet in pet_class.all
      if self == pet.owner
        pets << pet
      end
    end
    pets
  end

  def cats
    owners_pets(Cat)
  end

  def dogs
    owners_pets(Dog)
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end 
  end 

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end 
  end 
  
  def sell_pets
    pets = self.dogs + self.cats

    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
    

  def self.count
    self.all.count
  end 

  def self.reset_all
    self.all.clear 
  end 

end 
#rspec spec/01_owner_spec.rb

