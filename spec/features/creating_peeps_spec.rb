feature "Creating peeps" do

  scenario "I can create new peeps" do
    visit "/hub/new"
    fill_in :pweep, with: "My cat likes to demand attention at 5 am"
    click_button "Post peep"

    expect(current_path).to eq "/hub"

    within "ul#hub" do
      expect(page).to have_content "My cat likes to demand attention at 5 am"
    end

  end

end