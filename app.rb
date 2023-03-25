require './person'
require './teacher'
require './student'
require './book'
require './rental'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts 'List of all books:'
    @books.each { |book| puts book.title }
  end

  def list_people
    puts 'List of all people:'
    @people.each { |person| puts person.name }
  end

  def create_person(name, age, type, parent_permission: true, specialization: nil)
    if type == 'student'
      @people << Student.new(name, age, parent_permission)
    elsif type == 'teacher'
      @people << Teacher.new(name, age, specialization)
    else
      puts 'Invalid type of person!'
    end
  end

  def create_book(title, author)
    @books << Book.new(title, author)
  end

  def create_rental(book, person)
    @rentals << Rental.new(book, person)
  end

  def list_rentals(person_id)
    rentals = @rentals.select { |rental| rental.person.id == person_id }
    puts "List of all rentals for person with ID #{person_id}:"
    rentals.each { |rental| puts rental.book.title }
  end
end
