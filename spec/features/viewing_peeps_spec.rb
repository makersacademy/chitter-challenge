feature "Viewing peeps" do

  # As a Maker
  # So that I can let people know what I am doing
  # I want to post a message (peep) to chitter
  scenario "I can see existing peeps on the hub page" do
    Peep.create(pweep: "My cat likes to demand attention at 5 am")
    visit "/hub"
    expect(page.status_code).to eq 200

    within "ul#hub" do
      expect(page).to have_content "My cat likes to demand attention at 5 am"
    end
  end

end