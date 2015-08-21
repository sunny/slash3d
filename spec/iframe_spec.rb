require "spec_helper"
require "slash3d/iframe"

module Slash3D
  describe Iframe do
    let(:iframe) { described_class.new(options) }
    let(:options) { { source: 'http://source-url',
                      redirect_url: 'http://redirect-url' } }

    describe "#url" do
      before do
        allow(SecureRandom).to receive(:hex) { "c97ff01cdf0fca07a33dce9" }
      end

      it "returns an url" do
        url = "https://www.3dslash.net/slash.php" \
              "?content=c97ff01cdf0fca07a33dce9" \
              "&partner=test_partner_code" \
              "&redirect=http%3A%2F%2Fredirect-url" \
              "&sign=4c5fd2b2aa423d430f22ba940f4e28f7060fc39b2e44a70e656f74b94a38859c" \
              "&src=http%3A%2F%2Fsource-url"

        expect(iframe.url).to eq(url)
      end
    end
  end
end
