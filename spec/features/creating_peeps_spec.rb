feature 'Creating peeps' do
  scenario 'Add a new message' do
    visit ('/peeps/new')
    fill_in 'peep_user' , with: 'Banana1'
    fill_in 'message', with: 'My first peep'
    click_button 'Add'
    expect(page).to have_content('Banana1')
    expect(page).to have_content('My first peep')
  end

end
