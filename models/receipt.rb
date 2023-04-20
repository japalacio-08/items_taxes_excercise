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
    total_tax = 0
    items.each { |item| total_tax += item.total_sales_tax }
    total_tax
  end

  def calculate_total_price
    total_price = 0
    items.each { |item| total_price += item.total_price }
    total_price
  end

  def to_s
    output = ""
    @items.each { |item| output += "#{item}\n" }
    output += "Sales Taxes: #{'%.2f' % calculate_total_sales_tax}\n"
    output += "Total: #{'%.2f' % calculate_total_price}"
  end
end
