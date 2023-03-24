require './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  
  end

  def correct_name 
    @name
  end

  def can_use_services?(_is_of_age)
    return unless is_of_age? || @parent_permission

    true
  end

  private

  def of_age?
    return unless @age >= 18

    true
  end
end

class Decorator < Nameable
    def initialize(nameable)
        @nameable=nameable
    end

    def correct_name
        @nameable.correct_name
    end
end

class CapitalizeDecorator < Decorator
    def correct_name
     @nameable.correct_name.capitalize()
    end
 end
 
 class TrimmerDecorator < Decorator
     def correct_name
      @nameable.correct_name[0...10]
     end
  end

#   person = Person.new(22, 'maximilianus')
#   person.correct_name
#   capitalizedPerson = CapitalizeDecorator.new(person)
#   capitalizedPerson.correct_name
#   capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
#   capitalizedTrimmedPerson.correct_name
