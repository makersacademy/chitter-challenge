feature "user can let others know what they are doing by posting a peep" do
  scenario "user can post a peep" do
    visit '/peeps/new'

    fill_in 'peep', with: 'Just chilling...'
    fill_in 'time_of_peep', with: '14:54:50'
    click_button 'Submit'

    expect(page).to have_content('Just chilling...')
  end
end
