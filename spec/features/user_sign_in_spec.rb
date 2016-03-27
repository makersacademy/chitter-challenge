feature 'User can sign in' do

  let(:user) do
    User.create(name: 'John Doe',
                username: 'john123',
                email:'me@email.com',
                password: 'asd123',
                password_confirmation: 'asd123s')
  end

  scenario 'user can sign in with username' do
    visit '/session/new'
    fill_in :username_or_email, with: user.name
    fill_in :password, with: user.password
    click_button 'Sign in'
    expect(page.status_code).to eq 200
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Welcome, #{user.name}"
  end
end
