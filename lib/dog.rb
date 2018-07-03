require 'pry'
class Dog
attr_accessor :name, :breed, :id

def initialize(dog_hash)
  binding.pry
  @name = dog_hash[:name]
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
  #new_dog = self.new(dog_hash)
  #new_dog.name =  row[1]
  #new_dog.breed = row[2]
  #new_dog
  #end

  def save
  #  if self.id
  #self.update
#else
  sql = <<-SQL
    INSERT INTO dogs (name, breed)
    VALUES (?, ?)
  SQL

  DB[:conn].execute(sql, self.name, self.breed)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
  #end
end



end
