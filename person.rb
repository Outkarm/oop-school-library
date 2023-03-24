class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
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
