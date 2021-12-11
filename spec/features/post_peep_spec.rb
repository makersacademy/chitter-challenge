feature "user can let others know what they are doing by posting a peep" do
  scenario "user can post a peep" do
    visit '/peeps/new'

    fill_in 'peep', with: 'Just chilling...'
    click_button 'Submit'

    expect(page).to have_content('Just chilling...')
  end
end
