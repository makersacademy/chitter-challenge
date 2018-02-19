feature 'message peep' do
  scenario 'the user can post a message to the page' do
    visit '/'
    fill_in 'new_peep', with: 'This is a message!'
    click_button 'peep'
    expect(page).to have_content 'This is a message!'
  end
end
