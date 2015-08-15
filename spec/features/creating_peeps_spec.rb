feature 'creating peeps' do
  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in "content", with: "Wow I just saw a robot who looked a lot like a cop!"
    click_on "Peep it"
    expect(current_path).to eq "/"

    within "ul#peeps" do
      expect(page).to have_content "Wow I just saw a robot"
    end
  end
end