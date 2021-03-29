feature '/tweet' do
  scenario 'you can write a new tweet and see it returned after posting' do 
    visit '/'
    click_on 'Sign up'
    fill_in 'username', with: 'Test User'
    fill_in 'email', with: 'example@email.com'
    fill_in 'password', with: 'password'
    click_on 'Sign up'
    fill_in 'new_tweet', with: 'test tweet'
    click_on 'Tweet'
    expect(page).to have_content 'test tweet'
  end 

  scenario 'you can also delete the super awkward tweets that you posted years back and now make you want to barf' do 
    visit '/'
    click_on 'Sign up'
    fill_in 'username', with: 'Test User'
    fill_in 'email', with: 'example@email.com'
    fill_in 'password', with: 'password'
    click_on 'Sign up'
    first('.tweet').click_on 'delete'
    visit '/home'
    expect(page).not_to have_content 'my first tweet'
  end 

  scenario 'you can see who created a tweet' do 
    User.create(name: 'Nadia', email: 'test@example.com', password: 'password123')

    visit '/log_in'
    fill_in 'username', with: 'Nadia'
    fill_in 'password', with: 'password123'
    click_on 'Log in'
    fill_in 'new_tweet', with: 'test tweet'
    click_on 'Tweet'

    expect(page).to have_content '@Nadia tweeted'
  end 

end 
