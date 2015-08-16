feature 'creating peeps' do

  let(:user) { create :user }

  scenario "I cannot peep when logged out" do
    visit '/peeps/new'
    expect(current_path).to eq "/"
    expect(page).to have_content "You must be logged in to peep"
  end

  scenario "I can make peeps which are associated with me" do
    make_new_peep user, "Wow I just saw a robot who looked a lot like a cop!"
    expect(current_path).to eq "/"
    expect(user.peeps.map(&:content)).to include 'Wow I just saw a robot who looked a lot like a cop!'
    within "ul#peeps" do
      expect(page).to have_content "robotface (Robert)"
    end
  end

  scenario "My peeps have timestamps" do
    time = Timecop.freeze(Time.now)
    timestamp = time.strftime("at %I:%M%p on %e/%m/%y")
    make_new_peep user, "Wow I just saw a robot who looked a lot like a cop!"
    expect(current_path).to eq "/"
    within "ul#peeps" do
      expect(page).to have_content timestamp
    end
  end
end

