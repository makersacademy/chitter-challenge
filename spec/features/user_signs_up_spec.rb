feature 'User signs up' do
  scenario 'sign up' do
    visit '/users/new'

    fill_in :name, with: 'Peter Pan'
    fill_in :username, with: 'peterpan'
    fill_in :email, with: 'peter@neverland.com'
    fill_in :password, with: 'password'

    click_on 'Join Now'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'peterpan'
    expect(page).to have_content 'Log Out'
    expect(page).not_to have_content 'Sign Up'
    expect(page).not_to have_content 'Log In'
  end
end
