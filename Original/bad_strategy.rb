# We need a simple way to calculate shipping cost for an order.
# Each shipping company has a different rule for calculating the price.

# We want the system to:

# Support different shipping companies (FedEx, Aramex, DHL).

# Allow adding new companies in the future.

# Avoid using if/else to choose the company.

# Let the main calculator work with any company without changing the code.

# Task

# Refactor the code so the shipping logic uses Strategy Pattern.

# Your solution must:

# Have one strategy class for each shipping company.

# All strategies must have the same method (e.g. calculate(order)).

# The main ShippingCalculator should take the strategy from outside.

# No if, no case, no checking company names.

class ShippingCalculator
  def calculate(order, method)
    if method == :fedex
      order.weight * 10 + 15
    elsif method == :aramex
      order.weight * 8 + 10
    elsif method == :dhl
      order.weight * 12 + 20
    else
      raise "Unknown shipping method"
    end
  end
end

calc = ShippingCalculator.new
puts calc.calculate(OpenStruct.new(weight: 5), :fedex)
