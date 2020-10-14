require 'minitest/autorun'
require 'minitest/pride'
require './lib/shopping_cart'
require './lib/product'
class ShoppingCartTest < Minitest::Test
  def setup
    @cart = ShoppingCart.new("King Soopers", "30items")
    @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
  end

  def test_it_exists_and_has_attributes
    assert_equal 'King Soopers', @cart.name
    assert_equal 30, @cart.capacity
    assert_equal [], @cart.products
  end

  def test_cart_can_add_products_and_return_cart_details_hash
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    assert_equal [@product1, @product2], @cart.products
    expected = {name: "King Soopers", capacity: 30}
    assert_equal expected, @cart.details
  end
end
