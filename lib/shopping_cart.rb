class ShoppingCart
  attr_reader :name,
              :capacity,
              :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    cart_details = {}
    cart_details[:name] = @name
    cart_details[:capacity] = @capacity
    cart_details
  end

  def total_number_of_products
    sum = 0
    @products.each do |product|
      sum += product.quantity
    end
    sum
  end

  def is_full?
    if total_number_of_products >= @capacity
      true
    else
      false
    end
  end

  def percentage_occupied
    ((total_number_of_products.to_f / @capacity.to_f) * 100).round(2)
  end
end
