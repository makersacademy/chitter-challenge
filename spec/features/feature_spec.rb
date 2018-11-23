require 'pry'
require_relative '../../lib/database_connection'
feature 'user journey: ' do
  let(:test_peep) { 'This is a test peep' }

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
    click_on 'Submit'
    expect(page).to have_content(test_peep)
  end
end
