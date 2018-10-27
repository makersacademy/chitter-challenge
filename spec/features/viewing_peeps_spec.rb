require 'timecop'

feature 'Visting the homepage' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end

feature 'Viewing peeps' do
  scenario 'A user can see peeps and peep timestamps in reverse chronological order' do

    Timecop.freeze(time = Time.now) do
      Peep.create(message: 'My first peep', peep_timestamp: time)
      Peep.create(message: 'Hello', peep_timestamp: time)
    end
    visit('/peeps')
    expect(page).to have_content("Hello Posted at: #{(time.strftime("%Y-%m-%d %k:%M"))}\nMy first peep Posted at: #{(time.strftime("%Y-%m-%d %k:%M"))}")
  end
end
