# frozen_string_literal: true

class Receipt
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(name, price, quantity, imported, exempt)
    item = Item.new(name, price, quantity, imported, exempt)
    items << item
  end

  def calculate_total_sales_tax
    items.reduce(0) { |acc, current| acc + current.total_sales_tax }
  end

  def calculate_total_price
    items.reduce(0) { |acc, current| acc + current.total_price }
  end

  def to_s
    output = ""
    @items.each { |item| output += "#{item}\n" }
    output += "Sales Taxes: #{'%.2f' % calculate_total_sales_tax}\n"
    output += "Total: #{'%.2f' % calculate_total_price}"
  end
end
