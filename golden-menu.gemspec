# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'golden/menu/version'

Gem::Specification.new do |spec|
  spec.name          = 'golden-menu'
  spec.version       = Golden::Menu::VERSION
  spec.authors       = ['Tse-Ching Ho']
  spec.email         = ['tsechingho@gmail.com']
  spec.description   = %q{Golden Menu creates menus by building a hierarchiacal tree first and linking related resources later}
  spec.summary       = %q{creates menus by building a hierarchiacal tree first and linking related resources later}
  spec.homepage      = 'https://github.com/goldenio/golden-menu'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'railties', '>= 3.2.13', '< 5'
  spec.add_dependency 'activesupport', '>= 3.2.13', '< 5'
  spec.add_dependency 'actionpack', '>= 3.2.13', '< 5'
  spec.add_dependency 'activerecord', '>= 3.2.13', '< 5'
  spec.add_dependency 'awesome_nested_set', '>= 2.1'
  spec.add_dependency 'the_sortable_tree', '>= 2.3'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
