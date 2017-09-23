feature 'Add a new chit' do
  scenario 'The user creates a chit and can see it' do
    visit('/')
    click_button('NewChit')
    fill_in 'chit', with: 'My first chit'
    expect(page).to have_content('My first chit')
  end
end
