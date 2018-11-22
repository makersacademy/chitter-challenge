describe ChitterHandler do
  it "returns the stored peeps" do
    default_peep1 = ChitterHandler::DEFAULT_PEEPS[0]
    default_peep2 = ChitterHandler::DEFAULT_PEEPS[1]
    peeps = ChitterHandler.retrieve_peeps.map do |peep|
      peep['text']
    end
    expect(peeps).to include default_peep1, default_peep2
  end
end
