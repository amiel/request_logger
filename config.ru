require "rubygems"
require "bundler"
Bundler.setup
Bundler.require

require './request_logger'

run RequestLogger.new('requests.log')