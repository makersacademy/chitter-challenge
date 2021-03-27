feature 'homepage' do
  scenario 'A user can sign up' do 
    visit '/'
    fill_in 'username', with: 'Test User'
    fill_in 'email', with: 'example@email.com'
    fill_in 'password', with: 'password'
    click_on 'sign_up'
    expect(page).to have_content 'my first tweet'
  end
end 

feature '/home' do 
  scenario 'you get greeted by a list of tweets' do 
    visit '/home' 
    expect(page).to have_content "my first tweet"
  end 
end 