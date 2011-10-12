require "rubygems"
require "bundler"
Bundler.setup
Bundler.require

$: << File.expand_path(File.dirname(__FILE__) + '/lib')
require 'request_logger'
require 'app'

use RequestLogger, 'requests.log'

run App