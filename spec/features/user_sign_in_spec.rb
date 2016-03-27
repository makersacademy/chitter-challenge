feature 'User can sign in' do

  let(:user) do
    User.create(name: 'John Doe',
                email:'me@email.com',
                password: 'asd123',
                password_confirmation: 'asd123s')
  end

  scenario do
    visit '/session/new'
    fill_in :name, with: user.name
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password
    click_button 'Sign in'
    expect(page.status_code).to eq 200
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Welcome, #{user.name}"
  end
end
