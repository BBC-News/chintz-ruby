require 'dynamic_mustache.rb'
require 'yaml'

module Chintz
  class Parser

    def initialize
      @deps = {}
    end

    def prepare element_names
      element_names = [element_names] unless element_names.kind_of?(Array)
      element_names.each do |element_name|
        element = load_yaml element_name
        raise "Manifest must provide a Name" unless element["name"]
        return unless element['dependencies']
        resolve_dependencies element['dependencies']
      end
    end

    def load_yaml name
      yaml_path = Dir.glob("chintz/**/#{name}.yaml").first
      YAML.load_file yaml_path
    end

    def resolve_dependencies deps
      deps.each do |type, value|
        unless type == 'elements'
          add_dependency type, value
        end
        if type == 'elements'
          value.each do |child_element|
            prepare child_element #recursive
          end
        end
      end
    end

    def add_dependency type, value
      @deps[type] ||= []
      @deps[type].concat value
    end

    def dependency type
      @deps[type]
    end

    def render element, data = nil
      unless data
        data = fixture()
      end
      DynamicMustache.render_file(element, data);
    end

    def fixture
      {"stories" => [0,1]}
    end

  end
end
