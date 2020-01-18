feature 'Homepage' do
  scenario 'Homepage displays Chitter name' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end

  scenario 'Homepage has view peeps button' do
    visit '/'
    expect(page).to have_link 'View Peeps'
  end

  scenario 'Homepage has write a peep button if user is signed up' do
    sign_up
    visit '/'
    expect(page).to have_link 'Write a Peep'
  end

  scenario 'Homepage has sign up button' do
    visit '/'
    expect(page).to have_link 'Sign Up'
  end
end
