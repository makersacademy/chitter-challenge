feature "Displaying Peeps" do
  before do
    sign_up
  end

  scenario "peep has a time when it was created" do
    Timecop.freeze do
      peep
      expect(Peep.first.created_at).to eq Time.now
    end
  end

  scenario "displays peeps in a reverse chronological order" do
    peep(message: "first peep")
    Timecop.travel(60) do
      peep(message: "second peep")
      expect("second peep").to appear_before "first peep"
    end
  end
end
