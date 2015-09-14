require "active_support/core_ext/object/to_query"
require "securerandom"

module Slash3D
  # Represent an Iframe to build a model with 3D Slash
  class Iframe
    LANGUAGES = {
      'en' => 0,
      'fr' => 1
    }

    def initialize(content_id: nil,
                   source: nil,
                   redirect_url: nil,
                   lang: nil)
      @content_id = content_id
      @source = source
      @redirect_url = redirect_url
      @lang = lang
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
        lang: lang_number,
      }

      "https://www.3dslash.net/slash.php?" + parameters.to_query
    end

    private

    def lang_number
      LANGUAGES.fetch(lang || 'en')
    end

    def signature
      signature_values = [
        Slash3D.configuration.api_key,
        Slash3D.configuration.partner_code,
        content_id,
        source,
        redirect_url,
      ]

      Digest::SHA256.hexdigest(signature_values.join("|"))
    end

    attr_reader :source, :redirect_url, :lang
  end
end
