# frozen_string_literal: true

# Create a function that determines whether a shopping order is eligible for free shipping. An order is eligible for free shipping if the total cost of items purchased exceeds $50.00.

# Examples
# free_shipping({ "Shampoo" => 5.99, "Rubber Ducks" => 15.99 }) ➞ false

# free_shipping({ "Flatscreen TV" => 399.99 }) ➞ true

# free_shipping({ "Monopoly" => 11.99, "Secret Hitler" => 35.99, "Bananagrams" => 13.99 }) ➞ true

def free_shipping(order)
  basket = 0
  order.each_value do |key|
    basket += key
  end
  basket >= 50
end

puts free_shipping({ 'Monopoly' => 11.99, 'Secret Hitler' => 35.99 })

# def free_shipping(order)
# 	order.values.reduce(:+) > 50
# end