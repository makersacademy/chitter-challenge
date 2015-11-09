feature "Posting a peep" do

  scenario "Submitting a new peep as a logged-in user" do
    sign_up
    fill_in('peep', with: 'Good morning world!')
    click_button('Peep!')
    within('ul#peeps') do
        expect(page).to have_content('Good morning world!')
    end
  end
end
