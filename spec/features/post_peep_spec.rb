require_relative '../web_helpers'
require "timecop"

feature 'post peeps' do

  before do
    sign_up(email: "dave@dave.com", username: "Dave")
  end

  scenario 'Signed in user can post a peep' do
    expect(page).to have_content("Peeps")
    post_peep(peep_content: "My first peep")
    expect(page).to have_content "My first peep"
  end

  scenario 'Displays peeps in revere chronological order' do
    Timecop.freeze do
      post_peep(peep_content: "My first peep")
      Timecop.travel(DateTime.now + 1) do
        post_peep(peep_content: "My second peep")
      end
      expect(page.all(".peep-content").map(&:text)).to eq ["My second peep", "My first peep"]
    end
  end

  scenario 'User can see the time a peep was created' do
    Timecop.freeze do
      post_peep(peep_content: "My second peep")
      within(".peep") do
        expect(page).to have_content DateTime.now.strftime("%c")
      end
    end
  end

  scenario 'Sends email when tagged in a peep' do
    include Mail::Matchers
    Mail::TestMailer.deliveries.clear
    post_peep(peep_content: "Peep that has a tag", tags: 'Dave')
    expect(Mail::TestMailer.deliveries.length).to eq 1
    expect(Mail::TestMailer.deliveries.last.to).to eq ["dave@dave.com"]
  end

end
