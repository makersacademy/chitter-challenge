feature 'Sending peeps' do
  scenario 'Can send a peep' do
    visit '/'
    fill_in 'peep', with: 'My test peep!'
    click_button 'Send'
    expect(page).to have_content 'Peep sent successfull! (My test peep!)'
  end
end