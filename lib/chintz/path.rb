module Chintz
  class Path
    def self.resolve(base_path, name, extension)
      Dir.glob("#{base_path}/*/#{name}/#{name}.#{extension}").first
    end
  end
end
