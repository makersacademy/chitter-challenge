RSpec.feature 'Welcome screen' do
  scenario 'the headline is visible' do
    visit '/'
    expect(page).to have_content('Welcome to Chitter')
  end

  scenario 'there are correct links' do
    visit '/'
    expect(page).to have_link('Sign up for Chitter to Peep', href: '/register')
    expect(page).to have_link('See all Peeps', href: '/peeps')
  end
end