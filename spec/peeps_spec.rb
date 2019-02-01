describe Peeps do
  let(:peep) { Peeps.create(message: "my first chitter!")}

  describe "#created_at" do
    it { expect(peep).to respond_to(:created_at) }
    it { expect(peep.created_at).to be_kind_of(DateTime) }
  end

end
