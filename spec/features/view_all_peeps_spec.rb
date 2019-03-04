require File.join(File.dirname(__FILE__), '..', 'test_database_helpers.rb')
feature 'View all peeps' do
  scenario 'view all peeps' do
    build_peep
    visit '/chitter/peep/all'
    expect(page).to have_content 'This is a peep created by the test database helper' and 'This is a second peep created by the test database helper'
    expect(page).not_to have_button('back to homepage')
    expect(page).to have_button('back to mainpage')
  end
end
