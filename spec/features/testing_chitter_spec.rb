feature 'Checking the homepage' do
  scenario 'holds the welcome' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter you chatter')
  end
  scenario 'displays my peep' do
    visit('/')
    click_on '+Peep'
    fill_in 'peep_text', with: "My first peep!" 
    click_on 'Save'
    expect(page).to have_content('My first peep!')
  end
end