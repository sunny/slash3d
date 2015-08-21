require "active_support/core_ext/object/to_query"
require "securerandom"

module Slash3D
  class Response
    attr_reader :content

    def initialize(params)
      @api = params[:api]
      @content = params[:content]
      @uid = params[:dslashUID]
      @nonce = params[:nonce]
    end

    def stl_url
      action_url('stl')
    end

    def thumbnail_url(width: nil, height: nil)
      action_url('thumbnail', width: width, height: height)
    end

    def slash3d_url
      action_url('3dslash')
    end

    def url
      action_url('url')
    end


    private

    attr_reader :api, :nonce, :uid

    def action_url(action, width: nil, height: nil)
      params = {
        action: action,
        :alias => uid,
        nonce: nonce,
        partner: Slash3D.configuration.partner_code,
        sign: signature(action),
      }

      params[:width] = width if width
      params[:height] = height if height

      "#{api}?#{params.to_query}"
    end

    def signature(action)
      signature_values = [
        Slash3D.configuration.api_key,
        Slash3D.configuration.partner_code,
        nonce,
        uid,
        action,
      ]

      Digest::SHA256.hexdigest(signature_values.join('|'))
    end
  end
end
