feature 'viewing peeps' do
  scenario "I can see peeps on the main page" do
    user = create :user
    make_new_peep user, "Wow I just saw a robot who looked a lot like a cop!"
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content "Wow I just saw a robot"
  end

  scenario "peeps are ordered with most recent at the top" do
    user = create :user
    time = Timecop.freeze(Time.now)
    timestamp = time.strftime("at %I:%M%p on %e/%m/%y")
    make_new_peep user, "Wow I just saw a robot who looked a lot like a cop!"
    make_new_peep user, "Excuse me. I have to go. Somewhere there is a crime happening."
    expect(current_path).to eq "/"
    expect(page).to have_content "#{user.username} (#{user.name}) #{timestamp}: Excuse me. I have to go. Somewhere there is a crime happening. #{user.username} (#{user.name}) #{timestamp}: Wow I just saw a robot who looked a lot like a cop!"
  end
end