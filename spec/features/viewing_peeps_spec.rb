feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'Hello Chitter'
  end

  scenario 'A user can see peeps' do
    Peep.create(peep: "Bonjour", author: "Test")
    Peep.create(peep: "Hola", author: "Test")
    Peep.create(peep: "Namaste", author: "Test")

    visit '/peeps'
    
    expect(page).to have_content('Bonjour')
    expect(page).to have_content('Hola')
    expect(page).to have_content('Namaste')
    expect(page).to have_content('Test')
  end
end