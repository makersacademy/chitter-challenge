require 'pry'
require_relative '../../lib/database_connection'
require_relative './web_helpers'
feature 'user journey: ' do
  let(:test_peep) { 'This is a test peep to test form submissions' }

  before :each do
    10.times do |num|
      DatabaseConnection.query("INSERT INTO peeps (content) VALUES('This is a test peep #{num};')")
    end
  end

  scenario 'the app can list all peeps' do
    visit("/peeps")
    10.times do |num|
      expect(page).to have_content("This is a test peep #{num}")
    end
  end

  scenario 'A peep can be posted to chitter' do
    create_user
    sign_in
    visit("/peeps/new")
    fill_in 'content', with: test_peep
    click_on 'submit'
    expect(page).to have_content(test_peep)
  end

  scenario 'User can see the date that a peep was made' do
    create_user
    sign_in
    time = Time.new
    min = time.min
    if min < 10
      min = "0" << min.to_s
    end
    posted_at = "Posted at #{time.hour}:#{min} on #{time.day}/#{time.month}/#{time.year}"
    visit("/peeps/new")
    fill_in 'content', with: test_peep
    click_on 'submit'
    expect(page).to have_content(posted_at)
  end

  scenario 'a peep cannot be posted unless a user is signed in' do
    visit('/peeps/new')
    expect(page).to have_content("You need to be signed in to post a peep")
  end
end
