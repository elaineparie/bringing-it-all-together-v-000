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
  new_dog = self.new(hash)
  binding.pry
#  hash[:id] = row[0]
#  hash[:name] =  row[1]
#  hash[:breed] = row[2]
#  hash
  end


end
