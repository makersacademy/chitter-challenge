require 'setup_test_database'

feature 'view all peeps' do
  scenario 'user is able to see all peeps' do
    setup_test_database
    visit '/'
    click_button 'See latest Peeps!'

    expect(page).to have_content 'this is a test message'
  end
end
