feature 'creating a peep' do
  scenario 'requires sign in' do
    visit '/peeps/new'
    expect(page).to have_content('Sign in or Sign up')
  end

  let (:user) do
    User.create(name: 'Ivan Sathianathan', username: 'ivan', email: 'ivan@test.com', password: '12345', password_confirmation: '12345')
  end

  scenario 'when signed in displays peep' do
    sign_in(username: user.username, password: user.password)
    visit '/peeps/new'
    fill_in('content', with: 'Hello world!')
    click_button('Peep!')
    expect(page).to have_content('Hello world!')
    expect(page).to have_content('ivan')
  end
end
