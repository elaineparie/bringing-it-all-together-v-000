class Dog
attr_accessor :name, :breed, :id

def initialize(hash)
  name = hash[:name]
  breed = hash[:breed]
  id = hash[:id] 
end
end
