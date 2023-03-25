require './app'

class Main
  MENU = {
    '1' => :list_books,
    '2' => :list_people,
    '3' => :create_person,
    '4' => :create_book,
    '5' => :create_rental,
    '6' => :list_rentals_for_person,
    '7' => :quit
  }.freeze

  def initialize
    @app = App.new
  end

  def display_menu
    puts 'Library App Menu:'
    MENU.each { |key, value| puts "#{key}. #{value.to_s.capitalize.gsub('_', ' ')}" }
  end

  def run
    loop do
      display_menu
      choice = gets.chomp
      if MENU.keys.include?(choice)
        send(MENU[choice])
        break if choice == '7'
      else
        puts 'Invalid choice! Please try again.'
      end
    end
  end

  def list_books
    @app.list_books
  end

  def list_people
    @app.list_people
  end

  def create_person
    @app.create_person
  end

  def create_book
    @app.create_book
  end

  def create_rental
    @app.create_rental
  end

  def list_rentals_for_person
    @app.list_rentals_for_person
  end

  def quit
    puts 'Thank you for using the Library App. Goodbye!'
  end
end

Main.new.run
