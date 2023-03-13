require "peep"
require "shared_context_spec"

describe Peep do

  include_context "doubles setup"

  before { reset_peeps_table }
  before { reset_users_table }

  context ".get_tags method" do
    it "should return an array of username without the @ symbol" do
      content = 'Happy sunday! @changwynn @mrbike'
      result = described_class.get_tags(content)
      expect(result).to contain_exactly "changwynn", "mrbike"
    end
  end
end
