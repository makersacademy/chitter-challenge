# frozen_string_literal: true

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'post message' do
  scenario 'Write a message and post to chitter' do
    visit '/peep/new'
    fill_in('content', with: 'Blah blah blah')
    click_button('Post')
    expect(page).to have_content 'Blah blah blah'
  end
end
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
feature 'Show peeps in reverse order' do
  scenario 'peeps should be shown in reverse chronological order' do

  end
end
# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
feature 'Show time of post' do
  scenario 'when a peep is made, the time should be logged in the database' do
    time = Time.now.strftime("%H:%M")
    visit '/peep/new'
    fill_in('content', with: 'Blah blah blah')
    click_button('Post')
    expect(page).to have_content time
  end

  scenario 'when a peep is made, the date should be logged in the database' do
    date = Time.now.strftime("%-d %b %Y")
    visit '/peep/new'
    fill_in('content', with: 'Blah blah blah')
    click_button('Post')
    expect(page).to have_content date
  end

  scenario 'Time should logged and added to the database' do
    visit '/chitter'
    expect(page).to have_content Time.now.strftime("%H:%M")
end
    scenario 'Date should logged and added to the database' do
      visit '/chitter'
      expect(page).to have_content Time.now.strftime("%-d %b %Y")
end

end
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'log in' do
  scenario 'When visiting the homepage, a user should be able to log in' do
    visit '/'
    fill_in('username', with: 'Steve')
    click_button 'Submit'
    expect(page).to have_content 'Welcome to Chitter Steve!'
  end

  scenario 'Username should logged and added to the database' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO posts (id,message,username) VALUES (5, 'this is a message', 'Kriss');")
    visit '/chitter'
    expect(page).to have_content 'this is a message Kriss'
  end
end
# HARDER
#
# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter
#
# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter
#
# ADVANCED
#
# As a Maker
# So that I can stay constantly tapped in to the shouty box of Chitter
# I want to receive an email if I am tagged in a Peep
