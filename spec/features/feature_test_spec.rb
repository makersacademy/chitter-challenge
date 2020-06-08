require_relative './web_helper.rb'

feature 'has an opening browser page' do
  it 'Says welcome to Chitter on the home page' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end

  it 'Has a button a field to create a new peep' do
    visit('/')
    expect(page).to have_field('new_peep')
  end
end

feature 'Peep' do
  it 'Shows all peeps in reverse chronological order' do
    fill_db
    expect(page).to have_content('This is my first peep')
    expect(page).to have_content('tis but a peep')
    expect(page).to have_content('nobody expects the spanish inquisition')
  end
end

feature 'Sign up' do
  it 'Should have a sign up button' do
    visit('/')
    expect(page).to have_button('Sign up')
  end

  it 'Should take you to a sign up page and request info' do
    visit('/')
    click_button('Sign up')
    expect(page).to have_field('name')
    expect(page).to have_field('email')
    expect(page).to have_field('user_name')
    expect(page).to have_field('password')
  end

  it 'Should confirm that you have signed up on submitting details' do
    sign_up
    expect(page).to have_content('Welcome to Chitter!')
  end
end
