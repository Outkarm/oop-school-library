class Rental
    attr_accesor :date
    attr_reader :book, :person

    def initialize(date, book, person)
        @date = date
        @book = bookbook.rentals << self
        @person = person
        person.rentals << self
    end
end