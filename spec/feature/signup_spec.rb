feature 'signup' do
  scenario 'user signs up' do
    visit '/signup'
    expect(page).to have_content 'Sign up or log in if you want to post a peep or click here to see all the peeps'
    fill_in('email', :with => 'john@gmail.com')
    fill_in('name', :with => 'John')
    fill_in('username', :with => 'JohnJOJohnJay')
    fill_in('password', :with => 'Seekrit')
  end
end
