feature 'Sign up to Chitter' do
  def sign_up(password_confirmation = 'mypassword')
    visit('/user/new')
    expect(page.status_code).to eq(200)
    fill_in 'email',                  with: 'rob@gmail.com'
    fill_in 'password',               with: 'mypassword'
    fill_in 'password_confirmation',  with: password_confirmation
    fill_in 'name',                   with: 'Robert'
    fill_in 'user_name',              with: 'Rob'
    click_on('Sign up')
  end

  scenario 'User can sign up to Chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Rob!')
    expect(User.last.email).to eq('rob@gmail.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrongpassword') }.not_to change(User, :count)
  end
end
