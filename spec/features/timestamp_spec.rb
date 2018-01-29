# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

require 'timecop'

feature 'shows timestamp on peeps' do
  scenario "I can see the time a peep was posted" do
    Timecop.freeze do
      visit '/peeps/new'
      fill_in :new_peep, with: "My first peep"
      click_button 'peep!'
      expect(page).to have_content Time.now.strftime("%H:%M, %d %B")
    end
  end

  scenario "Peeps are displayed in reverse order" do
    create_peep('my first peep')
    create_peep('my second peep')
    expect('my second peep').to appear_before('my first peep')
  end

end
