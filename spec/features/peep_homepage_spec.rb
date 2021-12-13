require 'pg'

feature 'homepage for chitter' do
  scenario 'user can view peeps' do
    DatabaseConnection.query("INSERT INTO Users(email, password, name, username) VALUES($1, $2, $3, $4);", ['example@gmail.com', '*****', 'Birdy', 'fly_away'])
    user_id = DatabaseConnection.query("SELECT id FROM Users WHERE email = 'example@gmail.com';")
    DatabaseConnection.query("INSERT INTO Peeps(user_id, time, content) VALUES($1, $2, $3);", [user_id[0]["id"].to_i, '1999-01-08 04:05:06', 'Oh hey chitter!'])

    visit('/')
    
    expect(page).to have_content 'Oh hey chitter!'
  end

  scenario 'user can view multiple peeps on the homepage in reverse chronological order' do
    DatabaseConnection.query("INSERT INTO Users(email, password, name, username) VALUES($1, $2, $3, $4);", ['example@gmail.com', '*****', 'Birdy', 'fly_away'])
    user_id = DatabaseConnection.query("SELECT id FROM Users WHERE email = 'example@gmail.com';")
    DatabaseConnection.query("INSERT INTO Peeps(user_id, time, content) VALUES($1, $2, $3);", [user_id[0]["id"].to_i, '1999-01-08 04:05:06', 'Oh hey chitter!'])
    DatabaseConnection.query("INSERT INTO Peeps(user_id, time, content) VALUES($1, $2, $3);", [user_id[0]["id"].to_i, '3000-01-08 04:05:06', "Man I'm getting old!"])

    visit('/')
    
    expect(all(".peep").first).to have_content "Man I'm getting old!"
    expect(all(".peep").last).to have_content "Oh hey chitter!"
  end

  scenario 'user can add a peep to the homepage' do
    DatabaseConnection.query("INSERT INTO Users(email, password, name, username) VALUES($1, $2, $3, $4);", ['example@gmail.com', '*****', 'Birdy', 'fly_away'])

    visit('/log-in')
    fill_in('email', :with => 'example@gmail.com')
    fill_in('password', :with => '*****')
    click_on('Submit')
    
    fill_in('peep', :with => 'Oh hey chitter!')
    click_on('post')
    time = Time.now.strftime("%d/%m/%Y %k:%M")

    expect(page).to have_content 'Birdy'
    expect(page).to have_content 'fly_away'
    expect(page).to have_content 'Oh hey chitter!'
    expect(page).to have_content time
  end

  scenario 'the user can tag other users in their peep posts' do
    DatabaseConnection.query("INSERT INTO Users(email, password, name, username) VALUES($1, $2, $3, $4);", ['example@gmail.com', '*****', 'Birdy', 'fly_away'])
    DatabaseConnection.query("INSERT INTO Users(email, password, name, username) VALUES($1, $2, $3, $4);", ['friend@gmail.com', 'secret', 'Parrot', 'ahoy_matey'])

    visit('/log-in')
    fill_in('email', :with => 'example@gmail.com')
    fill_in('password', :with => '*****')
    click_on('Submit')
    
    fill_in('peep', :with => 'Oh hey chitter!')
    fill_in('tags', :with => 'ahoy_matey')
    click_on('post')
  
    expect(all(".peep").first).to have_content '@ahoy_matey'
  end

  scenario 'the user cannot tag users who are not registered with chitter' do
    DatabaseConnection.query("INSERT INTO Users(email, password, name, username) VALUES($1, $2, $3, $4);", ['example@gmail.com', '*****', 'Birdy', 'fly_away'])

    visit('/log-in')
    fill_in('email', :with => 'example@gmail.com')
    fill_in('password', :with => '*****')
    click_on('Submit')
    
    fill_in('peep', :with => 'Oh hey chitter!')
    fill_in('tags', :with => 'ahoy_matey')
    click_on('post')
  
    expect(page).to have_content 'ahoy_matey does not have a chitter account'
  end
end
