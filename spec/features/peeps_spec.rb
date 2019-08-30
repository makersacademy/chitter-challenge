feature 'Peeps page' do
  scenario 'it shows a list of peeps by date in reverse order' do
    Peep.create('My first peep!', '1')
    Peep.create('Hello', '1')
    Peep.create('World', '1')
    visit '/'
    expect(page).to have_content("World Hello My first peep!")
  end
  scenario 'can post a new peep if logged in' do
    sign_in
    click_button 'Create peep'
    fill_in(:content, with: 'I am writing a peep')
    click_button 'Peep!'
    expect(page).to have_content('I am writing a peep')
  end
end
