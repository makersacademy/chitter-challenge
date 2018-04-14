feature 'sign up' do
  scenario 'a user can sign up for chitter' do
    visit '/'
    click_button('Sign Up')
    fill_in('email', with: 'testing@hotmail.com')
    fill_in('username', with: 'testing')
    fill_in('name', with: 'Testy McTest')
    fill_in('password', with: 'password123')
    click_button('Sign Up')

    expect(page).to have_content "Welcome, Testy McTest"
  end

  scenario 'a user can sign up for chitter and post peeps in own name' do
    visit '/'
    click_button('Sign Up')
    fill_in('email', with: 'testing@hotmail.com')
    fill_in('username', with: 'testing')
    fill_in('name', with: 'Testy McTest')
    fill_in('password', with: 'password123')
    click_button('Sign Up')
    fill_in('peep', :with => 'my first peep!' )
    click_button 'Post'
    visit('/')
    expect(page).to have_content 'testing'


  end


end
