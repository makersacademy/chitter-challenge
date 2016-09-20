feature "Displaying Peeps" do
  before do
    sign_up
  end

  scenario "peep has a time when it was created" do
    Timecop.freeze do
      peep
      expect(Peep.first.created_at.to_i).to eq Time.now.to_i
    end
  end

  scenario "displays peeps in a reverse chronological order" do
    peep(message: "first peep")
    Timecop.travel(60) do
      peep(message: "second peep")
      expect("second peep").to appear_before "first peep"
    end
  end

  scenario "displays the time the peep was made" do
    Timecop.freeze do
      peep
      time = Time.now.strftime('%H:%M, %d %B %Y')
      expect(page).to have_content time
    end
  end
end
