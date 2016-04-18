require 'yaml'

module Chintz
  class Fixture
    def initialize(base_path)
      @base_path = base_path
    end

    def load_plain_yaml(name)
      YAML.load_file("#{@base_path}/fixtures/#{name}.yaml")
    end
  end
end
