feature 'Newsfeed' do
  scenario 'user is able to publish a peep' do
    visit '/peeps/new'
    fill_in 'peep_content', with: "Test peep"
    click_button 'Send'
    expect(page).to have_content "Test peep"
  end
end
