require 'json'
module Chintz
  class Fixture
    def self.load_plain_json name
      JSON.parse(IO.read("chintz/fixtures/#{name}.json"))
    end
  end
end
