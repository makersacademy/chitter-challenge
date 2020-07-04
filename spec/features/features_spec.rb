require './spec/web_helper.rb'

feature 'Users can post messages' do
  scenario 'User can see their message and name when they post a message' do
    post_message
    expect(page).to have_content('Hello Chitter!')
    expect(page).to have_content('James')
  end
end

feature 'Users can see other peoples messages' do
  scenario 'User can post a message and see previous messsages from the db' do
    add_peep
    post_message
    expect(page).to have_content('Hello Chitter!')
    expect(page).to have_content('James')
    expect(page).to have_content('This is my very first peep!')
  end
end