require 'pry'
class Dog
attr_accessor :name, :breed, :id

def initialize(dog_hash)
  @name = dog_hash[:name]
  binding.pry
  @breed = dog_hash[:breed]
  #@id = dog_hash[:id]
end

def self.create_table
sql = <<-SQL
CREATE TABLE IF NOT EXISTS dogs (
  id INTEGER PRIMARY KEY,
  name TEXT,
  breed TEXT
)
SQL
DB[:conn].execute(sql)
end

def self.drop_table
    sql = "DROP TABLE IF EXISTS dogs"
    DB[:conn].execute(sql)
  end

  def self.new_from_db(row)
  new_dog = self.new(hash)
  new_dog.name =  row[1]
  new_dog.breed = row[2]
  new_dog
  end


end
