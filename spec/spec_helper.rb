require 'rubygems'
require 'bundler/setup'

$:.unshift File.expand_path('../../lib', __FILE__)
require 'eventus'

Bundler.require :development

Dir[File.join(File.dirname(__FILE__), 'support', '*.rb')].each { |d| require d }
MONGO_URI = ENV['MONGO_URI'] || 'mongodb://localhost/test'

RSpec.configure do |config|
  config.mock_with :rspec
end

def create_commit(id, start, *bodies)
  if bodies[0].is_a? Range
    bodies = bodies[0]
  end
  bodies.each.with_index(start).map do |b, i|
    {
      'name' => 'cereal',
      'body' => b,
      'time' => Time.now.utc.iso8601,
      'sid' => id,
      'sequence' => i
    }
  end
end
