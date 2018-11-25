feature 'login' do
  scenario 'user logs in' do
    visit '/login'
    expect(page).to have_content 'Sign up or log in if you want to post a peep or click here to see all the peeps'
    fill_in('username', :with => 'JohnJOJohnJay')
    fill_in('password', :with => 'Seekrit')
  end
end
