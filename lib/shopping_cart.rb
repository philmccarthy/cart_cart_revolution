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
    {name: @name, capacity: @capacity}
  end

  def total_number_of_products
    @products.inject(0) do |sum, product|
      sum += product.quantity
    end
  end

  def is_full?
    total_number_of_products >= @capacity
  end

  def percentage_occupied
    ((total_number_of_products.to_f / @capacity.to_f) * 100).round(2)
  end

  def sorted_products_by_quantity
    @products.sort_by do |product|
      product.quantity
    end.reverse
  end

  def sorted_products_by_category
    @products.sort_by do |product|
      product.category
    end
  end

  def product_breakdown
    products = sorted_products_by_category
    products.group_by do |product|
      product.category
    end
  end
end
