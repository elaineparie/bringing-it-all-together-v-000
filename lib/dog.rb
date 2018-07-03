class Dog
attr_accessor :name, :breed, :id

def initialize(hash)
  hash[:name] = name
  hash[:breed] = breed
  hash[:id] = id
end
end
