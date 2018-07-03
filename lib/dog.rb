require 'pry'
class Dog
attr_accessor :name, :breed, :id

def initialize(hash)
  @name = hash[:name]
  @breed = hash[:breed]
  @id = hash[:id]
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
  new_dog = self.new(:id, :name, :breed)
  new_dog.id = row[0]
  new_dog.name =  row[1]
  new_dog.breed = row[2]
  new_dog
  end


end
