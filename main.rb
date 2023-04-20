require_relative 'sources'

# Assumptions made:

# Sales tax is always calculated at a rate of 10% for non-exempt items, and 5% for imported items.
# The quantities of items are integers and always greater than zero.
# The prices of items are floats and always greater than zero.
# The input is well-formatted with the correct syntax as shown in the example inputs.
# The rounding rules for sales tax, as mentioned in the problem statement, are followed.

# Example inputs
MOCKED_DATA_PATH = './mocks/mocked_data.json'

records = JsonReader.open(MOCKED_DATA_PATH)['data']

records.each do |record|
  receipt = Receipt.new
  record['items'].each do |item|
    receipt.add_item(item['name'], item['price'], item['quantity'], item['imported'], item['exempt'])
  end
  puts "---------------------------"
  puts "Output 1:\n#{receipt}\n\n"
end
