
class Item
  attr_accessor :name, :price

  @@items = []

  def self.items
    @@items
  end

  def initialize(name,price)
    @name = name
    @price = price
    @@items << self
  end
end
