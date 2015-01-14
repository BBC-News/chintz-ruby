require 'mustache'
class DynamicMustache < Mustache
  def self.partial(name)
    puts "#{template_path}/#{name}.#{template_extension}"
    IO.read(Dir.glob("chintz/**/#{name}/#{name}.mustache").first)
  end
end
