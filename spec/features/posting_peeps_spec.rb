feature 'Posting Peeps' do
  scenario 'User can post Peep' do
    visit '/peeps/new'
    fill_in "new_peep", with: 'What up, World!'
    click_button "Post Peep"
    expect(page).to have_content "What up, World!"
  end
end
