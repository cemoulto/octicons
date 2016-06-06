require 'json'

package = JSON.parse(File.read('package.json'))

Gem::Specification.new do |s|
  s.name        = package["name"]
  s.version     = package["version"]
  s.summary     = "GitHub's octicons rails helper"
  s.description = package["description"]
  s.authors     = ["GitHub Inc."]
  s.email       = "support@github.com"
  s.files       = Dir['{build,lib}/**/*'] + ['LICENSE', 'README.md']
  s.homepage    = package["homepage"]
  s.license     = "(OFL-1.1, MIT)"
  s.add_dependency "nokogiri", ">= 1.6.3.1"
end
