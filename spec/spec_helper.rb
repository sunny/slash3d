# require "webmock/rspec"

require "slash3d/configuration"

Slash3D.configure do |c|
  c.partner_code = "test_partner_code"
  c.api_key = "test_api_key"
end
