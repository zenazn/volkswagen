module VolkswagenTest
  module Helpers
    module FakeEnvironment
      def setup_environment
        @faked_env_keys = {}
      end

      def define_reset(name)
        unless @faked_env_keys.has_key?(name)
          if ENV.has_key?(name)
            @faked_env_keys[name] = lambda { |n| ENV.delete(n) }
          else
            old_value = ENV[name]
            @faked_env_keys[name] = lambda { |n| ENV[n] = old_value }
          end
        end
      end

      def add_environment_variable(name, value)
        define_reset(name)
        ENV[name] = value
      end

      def remove_environment_variable(name)
        define_reset(name)
        ENV.delete(name)
      end

      def reset_environment
        @faked_env_keys.each { |n,reset| reset.call(n) }
      end

      def self.included(m)
        m.before { setup_environment }
        m.after { reset_environment }
      end
    end
  end
end
