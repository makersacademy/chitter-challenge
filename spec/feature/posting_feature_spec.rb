feature 'users can post' do

     let!(:user) do
    User.create(email: 'user@example.com',
      password: '12345',
      name: 'Bobby',
      username: 'B123')
    end

  scenario 'user expects to see the post they submitted' do
    visit('/sessions/new')
    sign_in(username: user.username, password: user.password)
    fill_in_post
    expect(page).to have_content "this is my first post"
  end

  scenario 'the post is connected to the user who posted it' do
    visit('/sessions/new')
    sign_in(username: user.username, password: user.password)
    fill_in_post
    expect(page).to have_content "B123"
  end

end





 def sign_in(username:, password:)
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'Sign in'
end

def fill_in_post
    fill_in 'post', with: "this is my first post"
    click_button 'Submit'
end