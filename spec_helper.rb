require 'faraday'
require 'yarjuf'
require_relative 'helpers'

include Helpers

RSpec.configure do |c|
  c.output_stream = File.open("#{Dir.pwd}/inspec.xml", 'w')
  c.formatter = 'JUnit'
end
