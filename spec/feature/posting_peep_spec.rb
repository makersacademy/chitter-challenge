require 'timecop'


feature 'Posting a peep to chitter' do
  scenario "User's message is posted to the homepage" do
    visit('/peeps/new')
    fill_in('message', with: 'Hello, world')
    click_button('Submit')

    expect(page).to have_content 'Hello, world'
  end
end

feature 'Peeps shown in chronological order' do
  scenario 'Pages displays the most recent peeps' do
    Timecop.freeze(Time.parse("1:30pm, 28th November 2019")) do
      Message.post(message: 'Hello, world')
      Message.post(message: 'My second Peep')
      Message.post(message: 'My most recent Peep')

      visit('/peeps')

      expect(page).to have_content 'My most recent Peep 28 Nov 2019 13:30:00PM My second Peep 28 Nov 2019 13:30:00PM Hello, world 28 Nov 2019 13:30:00PM'
    end
  end
end

feature 'Display what time the peep was made' do
  scenario 'Page shows the time of peeps' do
    Timecop.freeze(Time.parse("1:30pm, 28th November 2019")) do
      Message.post(message: "Donald Trump said what?!")

      visit('/peeps')

      expect(page).to have_content "28 Nov 2019 13:30:00PM"
    end
  end
end
