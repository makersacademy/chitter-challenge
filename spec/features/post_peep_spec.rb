feature 'Sending peeps' do
  scenario 'Can send a peep' do
    visit '/'
    fill_in 'peep', with: 'My test peep!'
    fill_in 'username', with: 'Test'
    click_button 'Send'
    expect(page).to have_content 'Peep sent successfully! (My test peep!)'
  end
end