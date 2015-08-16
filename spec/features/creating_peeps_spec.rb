feature 'creating peeps' do

  scenario "I cannot peep when logged out" do
    visit '/peeps/new'
    expect(current_path).to eq "/"
    expect(page).to have_content "You must be logged in to peep"
  end

  scenario "I can make peeps which are associated with me" do
    user = create :user
    sign_in(user)
    visit '/peeps/new'
    fill_in "content", with: "Wow I just saw a robot who looked a lot like a cop!"
    click_on "Peep it"
    expect(current_path).to eq "/"
    user = User.get(user.id)
    expect(user.peeps.map(&:content)).to include 'Wow I just saw a robot who looked a lot like a cop!'
    within "ul#peeps" do
      expect(page).to have_content "robotface (Robert)"
    end
  end

  scenario "My peeps have timestamps" do
    time = Timecop.freeze(Time.now)
    timestamp = time.strftime("at %I:%M%p on %e/%m/%y")
    user = create :user
    sign_in(user)
    visit '/peeps/new'
    fill_in "content", with: "Wow I just saw a robot who looked a lot like a cop!"
    click_on "Peep it"
    expect(current_path).to eq "/"
    within "ul#peeps" do
      expect(page).to have_content timestamp
    end
  end
end