require 'mustache'
require 'chintz/path'

module Chintz
  class Mustache < ::Mustache
    def partial(name)
      path = Path.resolve(template_path, name, template_extension)

      begin
        File.read(path)
      rescue
        raise if raise_on_context_miss?
        ""
      end
    end
  end
end
