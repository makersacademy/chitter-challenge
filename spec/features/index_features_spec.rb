require 'pg'
require 'timecop'

feature 'Index page' do
  scenario 'should welcome me to the page' do
    visit('/')
    expect(page).to have_content("Chitter")
  end

  scenario 'should have a field to let me enter my message and submit it' do
    visit('/')
    fill_in 'message', with: 'Hello world'
    click_on 'Submit'
  end

  scenario 'should show me the messages I posted' do
    visit('/')
    fill_in 'message', with: 'First message'
    click_on 'Submit'
    expect(page).to have_content 'First message'
  end

  scenario 'viewing messages in database on page' do
    connection = PG.connect(dbname: 'chitter_db_test')
    connection.exec("INSERT INTO posts (message) VALUES ('First message');")
    connection.exec("INSERT INTO posts (message) VALUES ('Second message');")

    visit('/')
    expect(page).to have_content 'First message'
    expect(page).to have_content 'Second message'
  end

  scenario 'viewing messages in the right order' do
    visit('/')
    fill_in 'message', with: 'First message'
    click_on 'Submit'
    fill_in 'message', with: 'Second message'
    click_on 'Submit'
    within ('ul') do
      expect(all('li')[0].text).to eq 'Second message'
      expect(all('li')[1].text).to eq 'First message'
    end
  end

  scenario 'show a time and date' do
    date = Time.local(2018)
    Timecop.freeze(date) do
      visit('/')
      fill_in 'message', with: 'First message'
      click_on 'Submit'
      expect(page).to have_content("created_at: #{date.to_s}")
    end
  end
end
