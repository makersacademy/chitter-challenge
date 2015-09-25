feature 'Sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content
    expect(User.first.email).to eq 'jongmin@example.com'
  end

  def sign_up
    visit '/users/new'
    fill_in 'email', with: 'jongmin@example.com'
    fill_in 'name', with: 'Jongmin'
    fill_in 'nickname', with: 'Kim'
    fill_in 'password', with: 'foobar'
    fill_in 'password_confirmation', with: 'foobar'
    click_button 'Sign up'
  end
end
