feature "Logging in" do
  scenario 'correct login information' do
    register_a_user

    visit '/'
    click_link 'Login'

    fill_in :email, with: 'ash@pallet.com'
    fill_in :password, with: 'pikachu123'

    click_button 'Login'
    expect(page).to have_content 'Ash Ketchum (@red)'
    expect(page).not_to have_link 'Login'
    expect(page).not_to have_link 'Register'
  end

  scenario 'incorrect email' do
    register_a_user

    visit '/'
    click_link 'Login'

    fill_in :email, with: 'ash@palletcom'
    fill_in :password, with: 'pikachu123'

    click_button 'Login'
    expect(page).to have_content 'Incorrect email or password'
  end

  scenario 'incorrect password' do
    register_a_user

    visit '/'
    click_link 'Login'

    fill_in :email, with: 'ash@pallet.com'
    fill_in :password, with: 'pikachu'

    click_button 'Login'
    expect(page).to have_content 'Incorrect email or password'
  end
end
