module Slash3D
  class Configuration
    attr_accessor :api_key
    attr_accessor :partner_code
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
