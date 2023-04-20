# frozen_string_literal: true

class Item
  attr_reader :name, :price, :quantity, :imported, :exempt

  BASIC_SALES_TAX = 0.10 # 10% basic sales tax
  IMPORTED_ITEMS_TAX = 0.05 # 5% for imported items

  def initialize(name, price, quantity, imported, exempt)
    @name = name
    @price = price
    @quantity = quantity
    @imported = imported
    @exempt = exempt
  end

  def sales_tax
    tax_rate = 0.0
    return tax_rate if exempt && !imported

    tax_rate += BASIC_SALES_TAX unless exempt

    tax_rate += 0.05 if imported

    tax = (price * tax_rate)
    # Round up to the nearest 0.05
    tax = (tax * 20).ceil / 20.0
  end

  def total_sales_tax
    (sales_tax * quantity).round(2)
  end

  def total_price
    ((price + sales_tax) * quantity).round(2)
  end

  def import_label
    return '' unless imported

    return '' if name.include?('imported')

    return 'imported '
  end

  def to_s
    "#{@quantity} #{import_label}#{@name}: #{'%.2f' % total_price}"
  end
end
