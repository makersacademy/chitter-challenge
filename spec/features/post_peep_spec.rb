require_relative '../web_helpers'
require "timecop"

feature 'peeps' do

  before do
    sign_up(email: "dave@dave.com", username: "Dave")
  end

  scenario 'Signed in user can post a peep' do
    expect(page).to have_content("Peeps")
    post_peep(peep_content: "My first peep")
    expect(page).to have_content "My first peep"
  end

  scenario 'User can see the time a peep was created' do
    Timecop.freeze do
      post_peep(peep_content: "My second peep")
      within(".peep") do
        expect(page).to have_content DateTime.now.strftime("%c")
      end
    end
  end

  scenario 'Displays peeps in revere chronological order' do
    Timecop.freeze do
      post_peep(peep_content: "My first peep")
      Timecop.travel(DateTime.now + 1) do
        post_peep(peep_content: "My second peep")
      end
      expect(page).to have_content (DateTime.now + 1).strftime("%c") + " My second peep Tags: @Dave - " + (DateTime.now).strftime("%c") +" My first peep"
    end
  end

end
