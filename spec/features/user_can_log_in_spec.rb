feature 'User can log in with email and password' do

    let!(:user) do
      User.create(email: 'ana@great.com',
                  password: 'apples',
                  name: 'Ana Maria Suciu',
                  username: 'ana')
    end
    scenario 'user logs in with correct info' do
    sign_in(email: user.email, password: user.password)
    expect(current_path).to eq '/'
    save_and_open_page
    expect(page).to have_content "Welcome to Chitter, #{user.email}"
  end
end
