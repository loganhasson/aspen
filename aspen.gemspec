Gem::Specification.new do |s|
  s.name        = 'aspen'
  s.version     = '0.1.8'
  s.executables << 'aspen'
  s.date        = '2013-10-16'
  s.summary     = "aspen gem"
  s.description = "Sets up a simple directory tree for Ruby projects"
  s.authors     = ["Logan Hasson", "Josh Scaglione", "Ivan Brennan", "Matt Campbell" ]
  s.email       = "teamevalruby@gmail.com"
  s.files       = Dir["{help,bin,config}/*", "{lib}/**/*"]
  s.homepage    =
    'http://rubygems.org/gems/aspen'
  s.license       = 'MIT'
  s.add_runtime_dependency('rspec')
end