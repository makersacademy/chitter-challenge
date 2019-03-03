feature 'Signup for Chitter' do
  scenario 'allow a maker to signup for Chitter' do
    visit '/'

    expect(page).to have_content 'Welcome to Chitter!' and 'OR'
    expect(page).to have_button('View all Peeps')
    expect(page).to have_button('Signup')
    expect(page).to have_button('Login')
    expect(page).to have_content "to post a peep!"
    click_button 'Signup'
    expect(current_path).to eq '/chitter/signup'
    fill_in :name, with: 'Joe Bloggs'
    fill_in :user_name, with: 'joebloggs'
    fill_in :email, with: 'joebloggs@gmail.com'
    click_button 'Submit'
    expect(page).to have_content 'Welcome to Chitter Joe Bloggs' and 'What would you like to do?'
    expect(page).to have_button('view all peeps')
    expect(page).to have_button('create a peep')
  end
end
