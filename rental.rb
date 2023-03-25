class Rental
  attr_accesor :date
  attr_reader :book, :person

  def initialize(date, _book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end
end
