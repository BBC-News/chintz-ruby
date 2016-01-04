require 'mustache'

module Chintz
  class Mustache < ::Mustache
    def self.partial(name)
      puts "#{template_path}/#{name}.#{template_extension}"
      IO.read(Dir.glob("#{template_path}/**/#{name}/#{name}.mustache").first)
    end
  end
end
