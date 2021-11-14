require 'pg'

feature 'Visits the homepage' do
  scenario 'Visiting the index page' do
    visit('/')
    expect(page).to have_content 'Hello and Welcome to the Chitter app!'
  end
end

feature 'Viewing peeps' do 
  scenario 'A user can see peeps' do
    # connection = PG.connect(dbname: 'chitter_test')
    # # add test data
    # connection.exec("INSERT INTO peeps VALUES(1, 'Hello I am a peep!');")
    # connection.exec("INSERT INTO peeps VALUES(2, 'I too am a peep!');")
    Peep.create(text: 'Hello I am a peep!')
    Peep.create(text: 'I too am a peep!')
    
    visit('/peeps')
    
    expect(page).to have_content('Hello I am a peep!')
    expect(page).to have_content('I too am a peep!')
  end

  scenario 'A user can see peeps in chronological order' do
    # visit('/peeps/new')
    # fill_in('text', with: 'Chrono peep!')
    # click_button('Submit')
    # expect(current_path).to eq('/peeps')
    # # expect(page).to have_content('Chrono peep!')
    # expect(first('.text__time')).to have_text(/\d{2}:\d{2}:\d{2}/)
    # expect(page).to have_content Time.current
    allow(Time).to receive(:now).and_return(Time.parse("2019-04-27 11:14:20 +0100"))
    Peep.create(text: 'Chrono Peep!')
    visit '/peeps'
    expect(page).to have_content('Chrono Peep! 11:14, 27 April')
  end
  
  
end
