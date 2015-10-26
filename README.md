# Avios Cities

[![Gem Version](https://badge.fury.io/rb/avios_cities.svg)](http://badge.fury.io/rb/avios_cities) [![Build Status](https://travis-ci.org/timrogers/avios_cities.svg)](https://travis-ci.org/timrogers/avios_cities)

Avios Cities gives you up-to-date access to data on the airports accessible using Avios air miles flying from or to London.

## Usage

Install the gem *(Ruby 2.1.0 and later only)*:

```ruby
gem 'avios_cities', github: 'timrogers/avios_cities'
```

You can then look up a city by its IATA code (e.g. `MAK` for Marrakech) or, where one exists as for larger cities, its [Metropolitan Area Airport Code](http://wikitravel.org/en/Metropolitan_Area_Airport_Codes) (e.g. `LON` for London) using `AviosCities.find_by_iata_code`, which returns an object with a bunch of accessors like `name` and `city`:

```ruby
AviosCities.find_by_iata_code("LON")
=> #<Airports::Airport:0x007fd9a1bbd550 @name="Heathrow", @city="London", @country="United Kingdom", @iata="LHR", @icao="EGLL", @latitude="51.4775", @longitude="-0.461389", @altitude="83", @timezone="0", @dst="E">
```

A couple of other methods provide access to aggregate data.

You can call `AviosCities.iata_codes` for a list of valid IATA codes, perfect for Rails validations:

```ruby
validates :destination_city, inclusion: { in: AviosCities.iata_codes, message: "is not a valid destination" }
```

Or `AviosCities.all` will provide `AviosCities::City` objects representing all the cities the gem knows about.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/timrogers/mummy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## Acknowledgements

The data is taken from an [Avios private API](http://dev1-flightavail-avios.bitnamiapp.com:8080/flight-availability-ws/departure/cities/LON/destinations) used by one of their iOS apps (with London added, since it isn't included).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

