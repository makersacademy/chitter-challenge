feature 'creating peeps' do
  scenario 'I can create a new peep' do
    user = build :user
    sign_up(user)
    visit '/peeps/new'
    fill_in "content", with: "Wow I just saw a robot who looked a lot like a cop!"
    click_on "Peep it"
    expect(current_path).to eq "/"

    within "ul#peeps" do
      expect(page).to have_content "Wow I just saw a robot"
    end
  end

  scenario "I cannot peep when logged out" do
    visit '/peeps/new'
    expect(current_path).to eq "/"
    expect(page).to have_content "You must be logged in to peep"
  end

  scenario "Peeps I make are associated with me" do
    user = create :user
    sign_in(user)
    visit '/peeps/new'
    fill_in "content", with: "Wow I just saw a robot who looked a lot like a cop!"
    click_on "Peep it"
    expect(current_path).to eq "/"
    user = User.get(user.id)
    expect(user.peeps.map(&:content)).to include 'Wow I just saw a robot who looked a lot like a cop!'
    within "ul#peeps" do
      expect(page).to have_content "robotface (Robert): Wow I just saw a robot"
    end
  end
end