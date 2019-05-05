# Notes from an article by Yehuda Katz https://yehudakatz.com/2009/11/15/metaprogramming-in-ruby-its-all-about-the-self/

class Person
  def self.species
    "Homo Sapien"
  end
end

class Person
  class << self
    def species
      "Homo Sapien"
    end
  end
end

class << Person
  def species 
    "Homo Sapien"
  end
end

Person.instance_eval do 
  def species
    "Homo Sapien"
  end
end

def Person.species
  "Homo Sapien"
end

# All 5 examples define Person#species that returns "Homo Sapien"
# Consider the following example

Person.class #  => Class

class Class
  def loud_name
    "#{name.upcase}!"
  end
end

Person.loud_name # => "PERSON!"
# Person is an instance of Class, any methods added to class are available on Person as well.
# Each object in Ruby has its own metaclass, a class that can have methods but is only attached to the object
# itself (AKA eigenclass)
# that object will have access to all methods defined in the metaclass as well as the methods of its ancestors

matz = Object.new
def matz.speak
  "What is really good?"
end

matz.class # => Object
metaclass = class << matz; self; end
metaclass.instance_methods.grep(/speak/) # => ["speak"]
p metaclass.class
# The classic meta(programming) question will shed some light on what is indeed really good
# what is self?

class Person
  def name
    "Matz"
  end
  self.name # => "Person"
  # within the scope of the class, self is the Person class itself
end

Person.class_eval do
  def name
    "Matz"
  end
  self.name # => "Person"
end

# In this case, class_eval means that self will evaluate to person within the scope of the block

class << Person
  def species
    "Homo Sapiens"
  end

  self.name # => ""
end

# class << Person means that we are setting self to Person's metaclass for the scope of the block
# as a result, the species method is added to the Person's metaclass, rather than the class itself

class Person
  class << self
    def species
      "Homo Sapien"
    end
    self.name # => ""
  end
end

# This combination results in the species method being defined on the Person's metaclass

Person.instance_eval do
  def species
    "Homo Sapien"
  end
  self.name # => "Person"
end

# instance_eval does something interesting in that new methods are defined on the metaclass
# but self is still the receiver of instance_eval, in this case the class Person
