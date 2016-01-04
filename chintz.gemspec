lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'chintz/version'

Gem::Specification.new do |spec|
  spec.name          = 'chintz'
  spec.version       = Chintz::VERSION
  spec.authors       = ['John Clevely', 'Joseph Wynn']
  spec.email         = ['john.clevely@bbc.co.uk', 'joseph.wynn@bbc.co.uk']
  spec.summary       = 'Responsive images for Jekyll via srcset'
  spec.homepage      = 'https://github.com/BBC-News/chintz-ruby'
  spec.licenses      = ['Apache-2.0']
  spec.description   = %q{
    Ruby implementation of the BBC News Chintz specification
  }

  spec.files        = `git ls-files`.split($/)
  spec.test_files   = `git ls-files -- spec/*`.split("\n")
  spec.executables  = []
  spec.require_path = 'lib'
end
