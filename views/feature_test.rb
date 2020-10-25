require './lib/restaurant.rb'
require './lib/menu.rb'

restaurant = Restaurant.new

restaurant.order("hamburger", 10)
restaurant.order("chicken nuggets", 2)

p restaurant.view_basket
p restaurant.total_cost
restaurant.pay(15.88)
