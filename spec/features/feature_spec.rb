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
end

feature 'signin' do 
  scenario 'signin' do 
    visit '/'
    click_link('signin')
    expect(page).to have_content "Please enter usernamd and password"
  end
end

feature 'signup' do
  scenario 'signup' do
    visit '/' 
    click_link('signup')
    expect(page).to have_content "Please enter data to signup to Chitter"
  end
end
