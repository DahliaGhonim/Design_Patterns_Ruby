require 'ostruct'

class ShippingStrategyInterface
  def calculate(order)
    raise NotImplementedError, "Subclass must implement '#{__method__}'"
  end
end

class FedexShippingStrategy < ShippingStrategyInterface
  def calculate(order)
    order.weight * 10 + 15
  end
end

class AramexShippingStrategy < ShippingStrategyInterface
  def calculate(order)
    order.weight * 8 + 10
  end
end

class DHLShippingStrategy < ShippingStrategyInterface
  def calculate(order)
    order.weight * 12 + 20
  end
end

class ShippingCalculator
  attr_writer :shipping_strategy

  def initialize(shipping_strategy)
    @shipping_strategy = shipping_strategy
  end

  def calculate(order)
    @shipping_strategy.calculate(order)
  end
end

order = OpenStruct.new(weight: 5)

fedex_shipping = FedexShippingStrategy.new
calc = ShippingCalculator.new(fedex_shipping)
puts calc.calculate(order)

aramex_shipping = AramexShippingStrategy.new
calc.shipping_strategy = aramex_shipping
puts calc.calculate(order)

dhl_shipping = DHLShippingStrategy.new
calc.shipping_strategy = dhl_shipping
puts calc.calculate(order)
