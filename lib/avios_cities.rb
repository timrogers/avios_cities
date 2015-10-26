require 'json'
require 'avios_cities/version'
require 'avios_cities/city'

module AviosCities
  CITY_TYPE = "CITY".freeze

  def self.find_by_iata_code(iata_code)
    return unless iata_code.length == 3
    return unless airport_data = cities.find { |destination| destination["code"] == iata_code }

    City.new(name: airport_data["name"], code: airport_data["code"])
  end

  def self.iata_codes
    cities.map { |destination| destination["code"] }
  end

  def self.all
    @all ||= cities.map do |destination|
      City.new(name: destination["name"], code: destination["code"])
    end
  end

  def self.parsed_data
    @parsed_data ||= JSON.parse(data)
  end

  def self.cities
    @cities ||= parsed_data.fetch("destinations", {}).select do |destination|
      destination["type"] == CITY_TYPE
    end
  end
  private_class_method :cities

  def self.data
    @data ||= File.read(data_path)
  end
  private_class_method :data

  def self.data_path
    File.expand_path("../../data/cities.json", __FILE__)
  end
  private_class_method :data_path
end
