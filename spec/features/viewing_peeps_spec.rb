require 'orderly'
require 'timecop'

feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the main page' do
    Peep.create(message: 'Here is my opinion on something')
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Here is my opinion on something')
    end
  end

  scenario 'Peeps are in reverse chronological order' do
    Peep.create(message: 'older')
    Peep.create(message: 'newer')
    visit '/peeps'
    expect('newer').to appear_before('older')
  end

  scenario "I can see the time a peep was posted" do
    Timecop.freeze do
      Peep.create(message: 'Here is yet another opinion on something')
      visit '/peeps'
      expect(page).to have_content(DateTime.now.strftime("%H:%M on %d %b %Y"))
    end
  end
end
