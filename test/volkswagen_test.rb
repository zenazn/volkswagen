require_relative '_lib'

describe Volkswagen do
  it 'detects a fake CI environment' do
    ENV['CI'] = 'yes'
    assert(Volkswagen.ci?)
  end
end
