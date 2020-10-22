feature 'new peep' do
  scenario 'User adds a new peep' do
    visit('/chitter')
    fill_in 'peep', with: 'What is on your mind?'
    click_button 'Send it!'

    expect(page).to have_content 'What is on your mind?'
  end
end