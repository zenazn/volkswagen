require_relative '_lib'

describe Volkswagen do
  include VolkswagenTest::Helpers::FakeEnvironment

  describe '.ci' do
    it 'detects a lack of CI env' do
      ENV.keys.each { |n| remove_environment_variable(n) }
      refute(Volkswagen.ci?)
    end

    it 'detects a normal CI environment' do
      add_environment_variable('CI', 'yes')
      assert(Volkswagen.ci?)
    end

    it 'detects Solano CI' do
      add_environment_variable('TDDIUM', 'yes')
      assert(Volkswagen.ci?)
    end

    it 'detects Travis' do
      add_environment_variable('TRAVIS', 'yes')
      assert(Volkswagen.ci?)
    end
  end
end
