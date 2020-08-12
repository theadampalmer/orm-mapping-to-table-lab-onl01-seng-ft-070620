class Student
attr_accessor :name, :grade
attr_reader :id

DB[:conn]  

  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
  end

  def self.create_table
    
  end
  
  def self.drop_table
    
  end
  
  def save
    
  end
  
  def self.create
    
  end
    
end
