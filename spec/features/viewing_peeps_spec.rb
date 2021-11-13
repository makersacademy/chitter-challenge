feature 'Visits the homepage' do
  scenario 'Visiting the index page' do
    visit('/')
    expect(page).to have_content 'Hello and Welcome to the Chitter app!'
  end
end

feature 'Viewing peeps' do 
  scenario 'A user can see peeps' do
    visit('/peeps')
    expect(page).to have_content('Hello I am a peep!')
    expect(page).to have_content('I too am a peep!')
  end
end