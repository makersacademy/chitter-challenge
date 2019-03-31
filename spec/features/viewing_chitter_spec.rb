require 'date'
feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
    expect(current_path).to eq "/chitter"
  end

  scenario 'a user can see peeps' do
    Chitter.create(content: 'peep1')
    Chitter.create(content: 'peep2')
    Chitter.create(content: 'peep3')

    visit('/')

    expect(page).to have_content "peep1"
    expect(page).to have_content "peep2"
    expect(page).to have_content "peep3"
  end

  scenario 'peeps have info about date and time created' do
    Chitter.create(content: 'peep1')
    visit('/')

    expect(page).to have_content "peep1"
    expect(page).to have_content "Created:"
  end

  scenario 'peeps have info about user and name' do
    Chitter.create(content: 'peep1')
    visit('/')

    expect(page).to have_content "peep1"
    expect(page).to have_content "user:"
    expect(page).to have_content "name:"
  end
end
