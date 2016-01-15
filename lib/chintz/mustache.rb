require 'mustache'

module Chintz
  class Mustache < ::Mustache
    def partial(name)
      path = Dir.glob("#{template_path}/*/#{name}/#{name}.#{template_extension}").first

      begin
        File.read(path)
      rescue
        raise if raise_on_context_miss?
        ""
      end
    end
  end
end
