class BookInStock

  attr_reader :isbn
  attr_accessor :price

  def initialize(isbn, price)
    @isbn = isbn
    @price = Float(price)
  end

  def price_in_cents
    Integer(price * 100 + 0.5)
  end

  def price_in_cents=(cents)
    @price = cents / 100.0
  end 

  def to_s
    "ISBN: #{@isbn}, price: #{@price}"
  end
end

bk = BookInStock.new("isbn1", 1.14159)
puts bk
puts "ISBN = #{bk.isbn}"
bk.price = bk.price * 100

puts "New price = #{bk.price}"
puts "Price in cents = #{bk.price_in_cents}"
bk.price_in_cents = 31415
puts "Price = #{bk.price}"
puts "Price in cents = #{bk.price_in_cents}"
