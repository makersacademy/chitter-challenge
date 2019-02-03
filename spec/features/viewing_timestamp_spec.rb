feature 'Viewing Timestamp' do
  scenario '- should show timestamp on peep' do
    visit '/chitter'
    fill_in 'message', with: 'This is a test peep!'
    fill_in 'name', with: 'Jane'
    click_button 'Peep!'
  end
end
