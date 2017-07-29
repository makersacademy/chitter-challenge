require 'orderly'

feature 'Feature: viewing peeps' do

  scenario 'peeps appear reverse chronological order' do
    create_peep(content: 'Hi')
    create_peep(content: 'Bye')
    expect('Bye').to appear_before('Hi')
  end

  scenario 'peeps have time printed along with content' do
    t = Time.now
    create_peep(content: 'Hi')
    expect(page).to have_content t.strftime("%H:%M %d %B %Y")
  end

end
