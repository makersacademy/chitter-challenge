feature 'User can sign in' do

  let(:user) do
    User.create(name: 'John Doe',
                username: 'john123',
                email:'me@email.com',
                password: 'asd123',
                password_confirmation: 'asd123')
  end

  scenario 'User can sign in with username' do
    visit '/session/new'
    fill_in :username_or_email, with: user.username
    fill_in :password, with: 'asd123'
    click_button 'Sign in'
    expect(page.status_code).to eq 200
    expect(current_path).to eq '/chitter-feed/peeps'
    expect(page).to have_content "Welcome, #{user.name}"
  end

  scenario 'User can sign in with email' do
    visit '/session/new'
    fill_in :username_or_email, with: user.email
    fill_in :password, with: 'asd123'
    click_button 'Sign in'
    expect(page.status_code).to eq 200
    expect(current_path).to eq '/chitter-feed/peeps'
    expect(page).to have_content "Welcome, #{user.name}"
  end

  scenario 'Error message with wrong username password' do
    visit '/session/new'
    fill_in :username_or_email, with: user.username
    fill_in :password, with: 'wrong123'
    click_button 'Sign in'
    expect(page.status_code).to eq 200
    expect(current_path).to eq '/session/new'
    expect(page).to have_content "Wrong username/email or password!"
  end
end
