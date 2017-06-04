feature 'user signup' do

  scenario 'a new user can sign up' do
    visit '/signup'
    fill_in('email', with: 'a@b.com')
    fill_in('name', with: 'Michael Bluth')
    fill_in('username', with: 'hermano')
    expect { click_button('Sign Up') }.to change { User.count }.by(1)
    expect(User.first.email).to eq('a@b.com')
  end

  scenario 'user can set a password which is hashed in the database' do
    visit '/signup'
    fill_in('email', with: 'a@b.com')
    fill_in('name', with: 'Michael Bluth')
    fill_in('username', with: 'hermano')
    fill_in('password', with: 'abc123')
    click_button('Sign Up')
    expect(User.last.password_digest).not_to eq('abc123')
  end

end
