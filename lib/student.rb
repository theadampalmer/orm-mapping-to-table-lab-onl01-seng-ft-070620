class Student
attr_accessor :name, :grade
attr_reader :id

  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
  end

  def self.create_table
    sql = <<-SQL
    CREATE TABLE students(id integer PRIMARY KEY, name TEXT, grade integer)
    SQL
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    DB[:conn].execute("DROP TABLE students;")
  end
  
  def save
    sql = <<-SQL
    INSERT INTO students(name, grade) VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].execute("SELECT last_insert_rowid() from students")[0][0]
  end
  
  def self.create(name:, grade:)
    new(name, grade).tap {|student| student.save}
  end
    
end
