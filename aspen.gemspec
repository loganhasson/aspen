Gem::Specification.new do |s|
  s.name        = 'aspen'
  s.version     = '0.2.5'
  s.executables << 'aspen'
  s.date        = '2013-10-17'
  s.summary     = "aspen gem"
  s.description = "Sets up a directory tree for coding projects based on customizable templates"
  s.authors     = ["Logan Hasson", "Josh Scaglione", "Ivan Brennan", "Matt Campbell" ]
  s.email       = "teamevalruby@gmail.com"
  s.files       = Dir["{help,bin,config}/*", "{lib}/**/*"]
  s.homepage    =
    'http://rubygems.org/gems/aspen'
  s.license       = 'MIT'
  s.add_runtime_dependency('rspec')
  s.add_runtime_dependency('git')
  s.add_runtime_dependency('trollop')
end