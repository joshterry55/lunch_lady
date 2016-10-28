require 'pry'

# class Lunch_lady
#   attr_accessor :money
#   def initialize
#     puts "Welcome to the Cafeteria!"
#     puts "How much money do you have for lunch?"
#     @money = gets.strip.to_f
#     puts
#   end
# end
#
# Lunch_lady.new

puts "\nWelcome to the Cafeteria!!"

def initial_money
  puts "\nHow much money are we spending today?"
  @my_money = gets.strip.to_f
  @current_total = 0
  puts "Awesome! You have $#{@my_money}0 to spend on our delicious food!"
  puts "Lets see what we have today!"
  main_menu
end

def main_menu
  puts "\nWecome to the Ruby Cafe"
  puts "\n~~~ Daily Lunch Menu ~~~"
  puts "1: #{@hamburger.name} $#{@hamburger.price}0 (#{@hamburger.calories} Cal.)"
  puts "2: #{@pizza.name} $#{@pizza.price}0 (#{@pizza.calories} Cal.)"
  puts "3: #{@meatloaf.name} $#{@meatloaf.price}0 (#{@meatloaf.calories} Cal.)"
  puts "4: #{@nachos_supreme.name} $#{@nachos_supreme.price}0 (#{@nachos_supreme.calories} Cal.)"
  puts "\n ** Make A Selection **"
  puts "You have $#{@my_money}0 ----- Current order total: $#{@current_total}0"
  menu_selection
end

@current_order = []


def menu_selection
  selection = gets.strip.downcase
  case selection
  when "1", "hamburger"
    if @current_total + @hamburger.price <= @my_money
    @current_order << @hamburger
    @current_total += @hamburger.price
    else
      puts "You dont have enough money for that"
    end
  when "2", "pizza"
    if @current_total + @pizza.price <= @my_money
    @current_order << @pizza
    @current_total += @pizza.price
    else
      puts "You dont have enough money for that"
    end
  when "3", "meatloaf"
    if @current_total + @meatloaf.price <= @my_money
    @current_order << @meatloaf
    @current_total += @meatloaf.price
    else
      puts "You dont have enough money for that"
    end
  when "4", "nachos supreme", "nachos", "supreme"
    if @current_total + @nachos_supreme.price <= @my_money
    @current_order << @nachos_supreme
    @current_total += @nachos_supreme.price
    else
      puts "You dont have enough money for that"
    end
  else
    puts "We don't offer that here! Please choose from the options listed."
  end
  main_continue
end

def main_continue
  puts "\nDo you want another main dish? yes or no"
  case gets.strip.downcase
  when "yes", "y"
    main_menu
  when "no", "n"
    side_dish
  else
    main_continue
  end
end

def side_dish
  puts "\nWelcome to the Ruby Cafe"
  puts "\n~~~ Side Dish ~~~"
  puts "1: #{@salad.name} $#{@salad.price}0 (#{@salad.calories} Cal.)"
  puts "2: #{@mac_n_cheese.name} $#{@mac_n_cheese.price}0 (#{@mac_n_cheese.calories} Cal.)"
  puts "\n ** Make A Selection **"
  side_selection
end

def side_selection
  selection = gets.strip.downcase
  case selection
  when "1", "salad"
    if @current_total + @salad.price <= @my_money
    @current_order << @salad
    @current_total += @salad.price
    else
      puts "You dont have enough money for that"
    end
  when "2", "mac n cheese", "mac", "cheese"
    if @current_total + @mac_n_cheese.price <= @my_money
    @current_order << @mac_n_cheese
    @current_total += @mac_n_cheese.price
    else
      puts "You dont have enough money for that"
    end
  else
    puts "We don't offer that here! Please choose from the options listed."
    side_selection
  end
  side_continue
end

def side_continue
  puts "\nDo you want another side dish? yes or no"
  case gets.strip.downcase
  when "yes", "y"
    side_dish
  when "no", "n"
    checkout
  else
    puts "Invalid Input"
    side_continue
  end
end

def checkout
  puts "\nThank you for dining at the Ruby Cafe!"
  @my_money -= @current_total
  puts "You ordered: "
  puts
  @current_order.each do |item|
    puts "$#{item.price}0 #{item.name}"
  end
  puts
  puts "------TOTAL------"
  puts "#{@current_total}"
  puts "Is that correct? Say yes to checkout, say no to clear order and start over."
  puts ""
  case gets.strip.downcase
  when "yes", "y"
    puts "Awesome, Enjoy your food!"
  when "no", "n"
    @current_order = []
    initial_money
  else
  end
  puts "You have $#{@my_money}0 left!"
  puts "come again!"
  main_menu
end

class Food
  attr_accessor :name, :price, :calories
  def initialize (name, price, calories)
    @name = name
    @price = price
    @calories = calories
  end
end

#main dishes
@hamburger = Food.new("Hamburger", 5.00, 1200)
@pizza = Food.new("Pizza", 4.00, 1000)
@meatloaf = Food.new("Meatloaf", 3.00, 800)
@nachos_supreme = Food.new("Nachos Supreme", 6.00, 2100)
#side dishes
@salad = Food.new("Ceasar Salad", 1.00, 300)
@mac_n_cheese = Food.new("Mac N Cheese", 2.50, 500)
#desserts
@cheesecake = Food.new("Cheesecake", 3.25, 600)
@brownie = Food.new("Brownie", 2.75, 500)

while true
  initial_money
end
