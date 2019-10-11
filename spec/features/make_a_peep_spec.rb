feature 'Make a Peep' do

  scenario 'I can log in and make a peep, seeing both my username and the peep' do
    visit("/")
    fill_in('username', with: 'test_username')
    click_button 'Sign In'
    fill_in('peep', with: 'test peep')
    click_button 'Peep It'
    expect(page).to have_content('test peep')
  end

end
