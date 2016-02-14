# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Chitter wall:' do

  scenario 'User can choose to display or add peeps' do
    visit('/')
    expect(page).to have_selector(:button, count: 2)
  end

  scenario 'User can add a new peep' do
    fill_form
  end

  scenario 'User gets confirmation of new peep added' do
    fill_form
    expect(page).to have_content 'Peep saved!'
  end

end

