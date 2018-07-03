require 'pry'
class Dog
attr_accessor :name, :breed, :id

def initialize(dog_hash)
  @name = dog_hash[:name]
  @breed = dog_hash[:breed]
  @id = dog_hash[:id]
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
    hash = {}
    hash[:name] = row[1]
    hash[:breed] = row[2]
    hash[:id] = row[0]
  new_dog = self.new(hash)
  new_dog
  end

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
    self
  #end
end

self.create(hash)
new_dog = self.new(hash)
student.save
student
end 



end
