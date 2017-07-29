require_relative 'helpers'
require "timecop"

feature 'post peeps' do
  include Helpers

  before do
    sign_up(email: "dave@dave.com", full_name: "Mr Dave", username: "Dave")
  end

  scenario 'Signed in user can post a peep that shows full name and usernme' do
    expect(page).to have_content("Peeps")
    post_peep(peep_content: "My first peep")
    within ".peep" do
      expect(page).to have_content "Mr Dave"
      expect(page).to have_content "@Dave"
      expect(page).to have_content "My first peep"
    end
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

  scenario 'I can filter peeps by tag' do
    post_peep(peep_content: "My first peep", tags: "first")
    within ".peep" do
      click_on "first"
    end
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

  scenario 'Sends email when tagged in a peep' do
    include Mail::Matchers
    Mail::TestMailer.deliveries.clear
    post_peep(peep_content: "Peep that has a tag", tags: 'Dave')
    expect(Mail::TestMailer.deliveries.length).to eq 1
    expect(Mail::TestMailer.deliveries.last.to).to eq ["dave@dave.com"]
  end

  scenario 'I cannot post a peep when not logged in' do
    click_on 'Log out'
    visit('/peeps/new')
    expect(page).not_to have_content "Post"
  end

  scenario 'I can search for peeps containing chosen words' do
    post_peep(peep_content: "My first peep")
    post_peep(peep_content: "My second peep")
    fill_in 'search', with: 'first'
    click_on 'Search'
    within ".peep" do
      expect(page).to have_content "first"
      expect(page).not_to have_content "second"
    end
  end

  scenario 'Signed in users can delete peeps they posted' do
    post_peep(peep_content: "My first peep")
    within ".peep" do
      click_on 'Delete'
    end
    expect(page).not_to have_content "My first peep"
  end

  scenario 'Signed in users can reply to a peep' do
    post_peep(peep_content: "My first peep")
    within ".peep" do
      click_on 'Reply'
    end
    fill_in 'content', with: "Really interesting!"
    click_on "Reply"
    expect(page).to have_content "Really interesting!"
  end

end
