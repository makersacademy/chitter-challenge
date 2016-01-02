feature 'Client sign up' do
  scenario 'I can sign up as a new user with valid password' do
    expect { sign_up }.to change { User.count }.by(1)
    expect(User.first.email).to eq('test@email.com')
  end

  scenario "I can't sign up with wrong password confirmation" do
    visit('/users/new')
    expect(page.status_code).to eq(200)

    fill_in 'name',                   with: 'Name-Surname'
    fill_in 'username',               with: 'nickname'
    fill_in 'email',                  with: 'test@email.com'
    fill_in 'password',               with: 'secret_password'
    fill_in 'password_confirmation',  with: 'wrong_password'

    expect { click_button 'Sign up' }.not_to change(User, :count)
    expect(page).to have_content('Password does not match the confirmation')
  end
end
