require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/spec/spec_helper.rb'
require 'capybara'
require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/app.rb'
require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/app/Models/peep.rb'
require 'pg'
# session = Capybara::Session.new(:selenium)
# Capybara.ignore_hidden_elements = false


feature 'Creating peeps' do
  scenario "Add a peep and see it on the page" do
    visit('/peeps')
    p find_field('message')
    # fill_in 'message', with: 'TestMessage'
    # find_field('message').set(message)
    # page.fill_in :placeholder => 'message', with: 'TestMessage'
    click_button('Post peep')
    expect(page).to have_content('TestMessage')
    expect(page.current_path).to have_content('/peeps')
  end
end