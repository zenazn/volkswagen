require "volkswagen/version"

module Volkswagen
  BUILD_ENV_VARS=%w{CI CONTINUOUS_INTEGRATION TDDIUM TRAVIS BUILD_ID JENKINS_URL}

  def self.ci?
    BUILD_ENV_VARS.each { |var| return true if ENV[var] }
    false
  end
end
