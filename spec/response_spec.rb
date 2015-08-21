require "spec_helper"
require "slash3d/response"

module Slash3D
  describe Response do
    let(:response) { described_class.new(params) }
    let(:params) { { content: 'f004221',
                     dslashUID: 'b484221',
                     api: 'https://api.3dslash.net/',
                     nonce: 'e4f57b89' } }

    describe "#stl_url" do
      it "returns a full url to 3dslash" do
        url = "https://api.3dslash.net/" \
              "?action=stl" \
              "&alias=b484221" \
              "&nonce=e4f57b89" \
              "&partner=test_partner_code" \
              "&sign=d9c3924d0fb3e428034b6918f3d4d9f206e034baf7c25dbc602344ed60bd0d6d"

        expect(response.stl_url).to eq(url)
      end
    end

    describe "#thumbnail_url" do
      it "returns a full url to 3dslash" do
        url = "https://api.3dslash.net/" \
              "?action=thumbnail" \
              "&alias=b484221" \
              "&nonce=e4f57b89" \
              "&partner=test_partner_code" \
              "&sign=26ce6e91823e9cfe08ca520031dd417c2a928c61e62b2153a978787bfe813c62"

        expect(response.thumbnail_url).to eq(url)
      end

      it "adds the given width and height to the url" do
        url = "https://api.3dslash.net/" \
              "?action=thumbnail" \
              "&alias=b484221" \
              "&height=456" \
              "&nonce=e4f57b89" \
              "&partner=test_partner_code" \
              "&sign=26ce6e91823e9cfe08ca520031dd417c2a928c61e62b2153a978787bfe813c62" \
              "&width=123"

        expect(response.thumbnail_url(width: 123, height: 456)).to eq(url)
      end
    end

    describe "#slash3d_url" do
      it "returns a full url to 3dslash" do
        url = "https://api.3dslash.net/" \
              "?action=3dslash" \
              "&alias=b484221" \
              "&nonce=e4f57b89" \
              "&partner=test_partner_code" \
              "&sign=06de2763db0fbef294770827d9f5ddb613bc9c717a28381a44992ea36a515f29"

        expect(response.slash3d_url).to eq(url)
      end
    end

    describe "#url" do
      it "returns a full url to 3dslash" do
        url = "https://api.3dslash.net/" \
              "?action=url" \
              "&alias=b484221" \
              "&nonce=e4f57b89" \
              "&partner=test_partner_code" \
              "&sign=f3b529b43c4591de2f33049f7cd572f3faa024f43c0e75aef357b87daa5db2ca"

        expect(response.url).to eq(url)
      end
    end
  end
end
