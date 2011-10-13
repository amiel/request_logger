# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "request_logger/version"

Gem::Specification.new do |s|
  s.name        = "request_logger"
  s.version     = RequestLogger::VERSION
  s.authors     = ["Amiel Martin"]
  s.email       = ["amiel@carnesmedia.com"]
  s.homepage    = "http://github.com/amiel/request_logger"
  s.summary     = %q{Simple middleware to log incoming requests.}
  s.description = %q{}

  # s.rubyforge_project = "request_logger"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency "rack"
end
