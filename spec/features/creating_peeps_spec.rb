feature 'Creating peeps' do
  scenario 'I can create a peep' do
    visit '/peeps/new'
    fill_in 'name', with: 'Jack'
    fill_in 'message', with: 'Another peep!'
    click_button 'Send peep!'
    expect(page).to have_content('Another peep!')
  end
end
