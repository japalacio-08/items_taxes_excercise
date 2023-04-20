# frozen_string_literal: true

require 'json'

module JsonReader
  def self.open(url)
    file = File.read(url)
    JSON.parse(file)
  end
end
