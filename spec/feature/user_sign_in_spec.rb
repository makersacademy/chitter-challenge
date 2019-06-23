RSpec.feature 'User sign in' do

  scenario 'the user sign in' do

    visit '/chitter'
    click_button 'sign in'
    expect(current_path).to eq('/user_sign_in')

    fill_in 'email',     with: 'mail@mail.com'
    fill_in 'password',  with: 'password'
    fill_in 'name',      with: 'name'
    fill_in 'user_name', with: 'user_name'
    click_button 'submit'

    expect(current_path).to eq '/chitter'
    expect(page).to have_content "Welcome user_name"
  end
end