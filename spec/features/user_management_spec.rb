feature 'User Sign in' do
  before do
    sign_up
  end

  scenario 'successfully signs in' do
    sign_in
    expect(page).to have_content "Signed in as tom"
  end

  scenario 'shows an error on incorrect credentials' do
    sign_in(password: 'stupid wrong password')
    expect(page.current_path).to eq '/sessions'
    expect(page).to have_content "The email or password is incorrect"
  end
end

feature 'User Sign Out' do
  before do
    sign_up
    sign_in
  end

  scenario 'sign out button is visible when signed in' do
    expect(page).to have_button "Sign Out"
  end

  scenario 'successfully signs out' do
    click_button 'Sign Out'
    expect(page).to_not have_content 'Signed in as tom'
  end
end
