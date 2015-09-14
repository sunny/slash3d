require "spec_helper"
require "slash3d/iframe"

module Slash3D
  describe Iframe do
    let(:iframe) { described_class.new(options) }
    let(:options) { { source: "http://source-url",
                      redirect_url: "http://redirect-url" } }

    describe "#url" do
      before do
        allow(iframe).to receive(:content_id) { "c97ff01cdf0fca07a33dce9" }
      end

      it "returns a full url to 3dslash" do
        url = "https://www.3dslash.net/slash.php" \
              "?content=c97ff01cdf0fca07a33dce9" \
              "&lang=0" \
              "&partner=test_partner_code" \
              "&redirect=http%3A%2F%2Fredirect-url" \
              "&sign=4c5fd2b2aa423d430f22ba940f4e28f7060fc39b2e44a70e656f74b94a38859c" \
              "&src=http%3A%2F%2Fsource-url"

        expect(iframe.url).to eq(url)
      end

      context 'when given the "fr" lang' do
        let(:options) { { source: "http://source-url",
                          redirect_url: "http://redirect-url",
                          lang: "fr" } }

        it "contains the language number" do
          expect(iframe.url).to match(/&lang=1&/)
        end
      end
    end

    describe "#content_id" do
      it "generates a random hex" do
        expect(iframe.content_id).to match(/^[0-9a-f]{10,256}$/)
      end

      it "is memoized" do
        expect(iframe.content_id).to eq(iframe.content_id)
      end

      context "when given in the options" do
        let(:options) { { content_id: "f00" } }

        it "returns the same value" do
          expect(iframe.content_id).to eq("f00")
        end
      end
    end
  end
end
