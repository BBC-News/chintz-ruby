require 'yaml'
require 'chintz/mustache'
require 'chintz/path'

module Chintz
  class Parser

    def initialize(base_path, renderer = nil)
      @base_path = base_path
      @deps = {}

      @renderer ||= Chintz::Mustache
      @renderer.template_path = base_path
    end

    def prepare(element_names)
      element_names = [element_names] unless element_names.kind_of?(Array)
      element_names.each do |element_name|
        raise ArgumentError, 'String or Array of strings' unless element_name.kind_of? String
        element = load_yaml element_name
        raise NameError, 'Manifest must provide a Name' unless element['name']
        return unless element['dependencies']
        resolve_dependencies element['dependencies']
      end
      @deps
    end

    def load_yaml(name)
      yaml_path = Path.resolve(@base_path, name, 'yaml')

      raise NameError, "Manifest file for #{name} not found in #{@base_path}" if yaml_path.nil?

      YAML.load_file yaml_path
    end

    def resolve_dependencies(deps)
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

    def add_dependency(type, value)
      @deps[type] ||= []
      @deps[type].concat value
    end

    def dependency(type)
      @deps[type]
    end

    def render(element, data = nil)
      @renderer.render_file(element, data)
    end

  end
end
