require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/spec/spec_helper.rb'
require 'capybara'
require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/app.rb'
require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/app/Models/peep.rb'
require 'pg'
# session = Capybara::Session.new(:selenium)
# Capybara.ignore_hidden_elements = false

# before { Peep.create(message:'The CREATE message', timestamp: '1980-10-10 00:00:00')}


feature 'Creating peeps' do
  before { Peep.create(message:'The CREATE message', timestamp: '1980-10-10 00:00:00')}
  scenario "Add a peep and see it on the page" do
    visit('/peeps')
    click_button('PostPeep')
    expect(page).to have_content('The CREATE message')
    expect(page.current_path).to have_content('/peeps')
  end
end
