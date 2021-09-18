require 'setup_test_database'

feature 'view all peeps' do
  scenario 'user is able to see all peeps' do
    Peep.add(post: 'this is a test message')
    Peep.add(post: 'this is another test message')

    visit '/'
    click_button 'See latest Peeps!'

    expect(page).to have_content 'this is a test message'
    expect(page).to have_content 'this is another test message'
  end
end
