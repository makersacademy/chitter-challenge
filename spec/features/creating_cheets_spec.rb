feature 'Creating cheets' do
  scenario 'Add a new message' do
    visit ('/cheets/new')
    fill_in 'cheet_user' , with: 'Banana1'
    fill_in 'message', with: 'My first cheet'
    click_button 'Add'
    expect(page).to have_content('Banana1')
    expect(page).to have_content('My first cheet')
  end

end
