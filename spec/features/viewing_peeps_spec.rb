feature 'Visting the homepage' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do

    Peep.create(message: 'My first peep')
    Peep.create(message: 'Hello')

    visit('/peeps')
    
    expect(page).to have_content 'My first peep'
    expect(page).to have_content 'Hello'
  end
end
