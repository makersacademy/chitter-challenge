feature 'index' do
  scenario 'shows peeps' do
    visit '/'
    expect(page).to have_content 'Sign up if you want to post a peep or click here to see all the peeps'
    click_link('here')
    expect(current_path).to eq '/peeps'

  end
  scenario 'user signs in' do
    visit '/'
    expect(page).to have_content 'Sign up if you want to post a peep or click here to see all the peeps'
    fill_in('email', :with => 'john@gmail.com')
    fill_in('name', :with => 'John')
    fill_in('username', :with => 'JohnJOJohnJay')
    fill_in('password', :with => 'Seekrit')
  end
end
