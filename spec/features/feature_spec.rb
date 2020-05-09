feature 'homepage' do 
  scenario 'it has correct text on homepage' do 
    visit '/'
    expect(page).to have_content "CHITTER"
  end
  scenario 'it has signin button' do
    visit('/')
    expect(page).to have_link('signin', :href => '/signin')
    expect(page).to have_link('signup', :href => '/signup')
  end
  scenario 'it loads peeps from database' do 
    visit('/')
    expect(page).to have_content 'test1 test1 test1'
    expect(page).to have_content 'test2 test2 test2'
    expect(page).to have_content 'test3 test3 test3'
    expect(page).to have_content 'Jimmy aka @Jim1984'
  end
end

feature 'signin' do 
  scenario 'signin' do 
    visit '/'
    click_link('signin')
    expect(page).to have_content "Please enter username and password"
    fill_in('user_name', with: 'Jim1984')
    fill_in('password', with: 'password')
    click_button('submit')
    expect(page).to have_content 'Hello Jimmy'
  end
end

feature 'signup' do
  scenario 'signup and add peep' do
    signup_test
    expect(page).to have_content "Hello Joe Bloggs"
  end
end

feature 'add peep' do 
  scenario 'you can add a peep' do 
    signup_test
    add_peep_test
    click_button 'submit'
    expect(page).to have_content 'This is a peep'
    click_link 'my_peeps'
    expect(page).to have_content 'This is a peep'
  end
end

