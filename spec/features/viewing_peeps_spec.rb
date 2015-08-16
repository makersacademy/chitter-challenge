feature 'viewing peeps' do
  scenario "I can see peeps on the main page" do
    user = create :user
    peep = Peep.new(content: "Wow I just saw a robot who looked a lot like a cop!",)
    peep.save
    user.peeps << peep
    user.save
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content "Wow I just saw a robot"
  end

  scenario "peeps are ordered with most recent at the top" do
    user = create :user
    time = Timecop.freeze(Time.now)
    timestamp = time.strftime("at %I:%M%p on %e/%m/%y")
    sign_in(user)
    visit '/peeps/new'
    fill_in "content", with: "Wow I just saw a robot who looked a lot like a cop!"
    click_on "Peep it"
    visit '/peeps/new'
    fill_in "content", with: "He looked confused about his reality!"
    click_on "Peep it"
    expect(current_path).to eq "/"
    expect(page).to have_content "#{user.username} (#{user.name}) #{timestamp}: He looked confused about his reality! #{user.username} (#{user.name}) #{timestamp}: Wow I just saw a robot who looked a lot like a cop!"
  end
end