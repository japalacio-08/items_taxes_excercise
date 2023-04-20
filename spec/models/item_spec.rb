# frozen_string_literal: true

require_relative '../spec_helper'

describe Item do
  let(:item1) { Item.new("book", 12.49, 2, false, true) }
  let(:item2) { Item.new("music CD", 14.99, 1, false, false) }
  let(:item3) { Item.new("chocolate bar", 0.85, 1, false, true) }
  let(:item4) { Item.new("box of chocolates", 10.00, 1, true, true) }

  describe '#sales_tax' do
    it 'returns the correct sales tax for exempt item' do
      expect(item1.sales_tax).to eq(0.0)
    end

    it 'returns the correct sales tax for non-exempt item' do
      expect(item2.sales_tax).to eq(1.50)
    end

    it 'returns the correct sales tax for imported item' do
      expect(item4.sales_tax).to eq(0.5)
    end
  end

  describe '#total_sales_tax' do
    it 'returns the correct total sales tax for multiple items' do
      expect(item1.total_sales_tax).to eq(0.0)
      expect(item2.total_sales_tax).to eq(1.50)
      expect(item3.total_sales_tax).to eq(0.0)
    end
  end

  describe '#total_price' do
    it 'returns the correct total price for multiple items' do
      expect(item1.total_price).to eq(24.98)
      expect(item2.total_price).to eq(16.49)
      expect(item3.total_price).to eq(0.85)
    end
  end

  describe '#to_s' do
    it 'returns the correct string representation of an item' do
      expect(item1.to_s).to eq("2 book: 24.98")
      expect(item2.to_s).to eq("1 music CD: 16.49")
      expect(item3.to_s).to eq("1 chocolate bar: 0.85")
      expect(item4.to_s).to eq("1 imported box of chocolates: 10.50")
    end
  end
end
