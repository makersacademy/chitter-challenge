feature '3. User can create a peep' do
  scenario 'From page' do
    signup
    login
    fill_in(:message, with: 'Hello Chitter!')
    click_button('newpeep')
    expect(page).to have_content 'Hello Chitter!'
  end
end
