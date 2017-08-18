require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'test/unit'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'fileutils'
require 'fluent/plugin/filter'
require 'fluent/plugin/output'

unless defined?(Test::Unit::AssertionFailedError)
  class Test::Unit::AssertionFailedError < StandardError
  end
end

class Test::Unit::TestCase
end
