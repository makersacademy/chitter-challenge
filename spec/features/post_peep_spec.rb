require_relative '../web_helpers'
require "timecop"

feature 'peeps' do

  before :each { sign_up }

  scenario 'Signed in user can post a peep' do
    post_peep(peep_content: "My first peep")
    expect(page).to have_content "My first peep"
  end

  scenario 'User can see the time a peep was created' do
    Timecop.freeze do
      post_peep(peep_content: "My second peep")
      # within(".peep .timestamp") do
        expect(page).to have_content DateTime.now
      # end
    end
  end

end
