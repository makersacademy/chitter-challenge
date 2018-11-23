require 'pry'
require_relative '../../lib/database_connection'
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
    visit("/peeps/new")
    fill_in 'content', with: test_peep
    click_on 'submit'
    expect(page).to have_content(test_peep)
  end

  scenario 'User can see the date that a peep was made' do
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
end
