require "active_support/core_ext/object/to_query"
require "securerandom"

module Slash3D
  class Iframe
    def initialize(content_id: nil,
                   source: nil,
                   redirect_url: nil)
      @content_id = content_id
      @source = source
      @redirect_url = redirect_url
    end

    def content_id
      @content_id ||= SecureRandom.hex(32)
    end

    def url
      parameters = {
        partner: Slash3D.configuration.partner_code,
        content: content_id,
        src: source,
        redirect: redirect_url,
        sign: signature,
      }

      "https://www.3dslash.net/slash.php?" + parameters.to_query
    end

    private

    def signature
      signature_values = [
        Slash3D.configuration.api_key,
        Slash3D.configuration.partner_code,
        content_id,
        source,
        redirect_url,
      ]

      Digest::SHA256.hexdigest(signature_values.join('|'))
    end

    attr_reader :source, :redirect_url
  end
end
