require 'yaml'
module Chintz
  class Fixture
    def self.load_plain_yaml name
      YAML.load_file("chintz/fixtures/#{name}.yaml")
    end
  end
end
