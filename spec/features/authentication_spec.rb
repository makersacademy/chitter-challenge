feature 'Authentication' do
  scenario 'a user can sign in to Chitter' do
    User.create(name: 'Bob', username: 'BobBamBoom', email: 'Bob@example.com', password: 'Banana123')

    visit '/peeps'
    click_button 'Sign In'
    fill_in 'email', with: 'Bob@example.com'
    fill_in 'password', with: 'Banana123'
    click_button 'Sign In'

    expect(page).to have_content 'Welcome, BobBamBoom'
  end

  scenario 'an error displays if user gives an incorrect email' do
    User.create(name: 'Bob', username: 'BobBamBoom', email: 'Bob@example.com', password: 'Banana123')

    visit '/peeps'
    click_button 'Sign In'
    fill_in 'email', with: 'Bib@exomple.com'
    fill_in 'password', with: 'Banana123'
    click_button 'Sign In'

    expect(page).not_to have_content 'Welcome, BobBamBoom'
    expect(page).to have_content "Something wasn't right! Try again..."
  end

  scenario 'an error displays if user gives an incorrect password' do
    User.create(name: 'Bob', username: 'BobBamBoom', email: 'Bob@example.com', password: 'Banana123')

    visit '/peeps'
    click_button 'Sign In'
    fill_in 'email', with: 'Bob@example.com'
    fill_in 'password', with: 'Orange123'
    click_button 'Sign In'

    expect(page).not_to have_content 'Welcome, BobBamBoom'
    expect(page).to have_content "Something wasn't right! Try again..."
  end

  scenario 'a user can sign out' do
    User.create(name: 'Bob', username: 'BobBamBoom', email: 'Bob@example.com', password: 'Banana123')
    
    visit '/peeps'
    click_button 'Sign In'
    fill_in 'email', with: 'Bob@example.com'
    fill_in 'password', with: 'Banana123'
    click_button 'Sign In'
    
    click_button 'Sign Out'
    
    expect(page).not_to have_content 'Welcome, BobBamBoom'
    expect(page).to have_content 'Bye for now. Come back soon!'
  end  
end
