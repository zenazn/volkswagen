require 'minitest/spec'
require 'minitest/autorun'
require 'volkswagen'

describe Volkswagen do
  it 'detects a fake CI environment' do
    ENV['CI'] = 'yes'
    assert(Volkswagen.ci?)
  end
end
