class Classroom
  attr_accesor :label
  attr_reader :students

  def initialize(_label)
    @label = lebel
    @classroom = []
  end

  def add_student(student)
    @students << Student
    student.classroom = self
  end
end