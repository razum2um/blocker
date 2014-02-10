require 'spec_helper'

# BLOCKER: https://github.com/razum2um/blocker/issues/1/
describe Blocker::Parser do
  let(:parser) { described_class.new('./spec/blocker') }

  it 'finds lines with annotations' do
    expect(parser).to receive(:process).once.with('github.com', 'razum2um/blocker/issues/1')
    parser.parse
  end
end
