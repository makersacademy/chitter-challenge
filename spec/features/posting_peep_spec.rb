feature 'User can create a peep' do
  scenario 'Add a message (peep) to chitter' do
    visit('/')
    fill_in 'message' , with: 'Hello world!'
    click_button 'Peep'
    expect(page).to have_content('Hello world')
  end
end
