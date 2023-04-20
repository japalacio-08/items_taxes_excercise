RSpec.describe Receipt do
  describe '#add_item' do
    it 'should add an item to the items list' do
      receipt = Receipt.new
      receipt.add_item('book', 12.49, 1, false, true)
      expect(receipt.items.size).to eq(1)
    end
  end

  describe '#calculate_total_sales_tax' do
    it 'should return the total sales tax for all items' do
      receipt = Receipt.new
      receipt.add_item('book', 12.49, 2, false, true)
      receipt.add_item('music CD', 14.99, 1, false, false)
      expect(receipt.calculate_total_sales_tax).to eq(1.50)
    end
  end

  describe '#calculate_total_price' do
    it 'should return the total price including sales tax for all items' do
      receipt = Receipt.new
      receipt.add_item('book', 12.49, 2, false, true)
      receipt.add_item('music CD', 14.99, 1, false, false)
      expect(receipt.calculate_total_price).to eq(41.47)
    end
  end

  describe '#to_s' do
    # Veryfing test
    it 'should return a string representation of the receipt, including all the items, their quantities, prices, and the total amount' do
      receipt = Receipt.new
      receipt.add_item('book', 12.49, 2, false, true)
      receipt.add_item('music CD', 14.99, 1, false, false)
      expected_output = "2 book: 24.98\n1 music CD: 16.49\nSales Taxes: 1.50\nTotal: 41.47"
      expect(receipt.to_s).to eq(expected_output)
    end

    # Test case 1
    it "Input 1:\n2 book at 12.49\n music CD at 14.99\1 chocolate bar at 0.85" do
      receipt = Receipt.new
      receipt.add_item("book", 12.49, 2, false, true)
      receipt.add_item("music CD", 14.99, 1, false, false)
      receipt.add_item("chocolate bar", 0.85, 1, false, true)
      expected_output = "2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 42.32"
      expect(receipt.to_s).to eq(expected_output)
    end

    # Test case 2
    it "Input 2:\n1 imported box of chocolates at 10.00\n1 imported bottle of perfume at 47.50" do
      receipt = Receipt.new
      receipt.add_item("imported box of chocolates", 10.00, 1, true, true)
      receipt.add_item("imported bottle of perfume", 47.50, 1, true, false)
      expected_output = "1 imported box of chocolates: 10.50\n1 imported bottle of perfume: 54.65\nSales Taxes: 7.65\nTotal: 65.15"
      expect(receipt.to_s).to eq(expected_output)
    end

    # Test case 3
    it "Input 3:\n1 imported box of chocolates at 10.00\n1 imported bottle of perfume at 47.50" do
      receipt = Receipt.new
      receipt.add_item("imported bottle of perfume", 27.99, 1, true, false)
      receipt.add_item("bottle of perfume", 18.99, 1, false, false)
      receipt.add_item("packet of headache pills", 9.75, 1, false, true)
      receipt.add_item("imported boxes of chocolates", 11.25, 3, true, true)
      expected_output = "1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n3 imported boxes of chocolates: 35.55\nSales Taxes: 7.90\nTotal: 98.38"
      expect(receipt.to_s).to eq(expected_output)
    end
  end
end
