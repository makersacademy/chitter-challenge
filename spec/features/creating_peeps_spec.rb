feature 'Posting a new Peep' do
  scenario 'user can post a new Peep' do
    visit '/peeps/new'
    
    fill_in "peep", with: "This is my test peep"
    click_button "Peep!"

    expect(page).to have_content "This is my test peep"
  end
end
