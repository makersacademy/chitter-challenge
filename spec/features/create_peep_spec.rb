feature 'creating a peep' do
  scenario 'requires sign in' do
    visit '/peeps/new'
    fill_in('peep', with: 'Hello world!')
    click_button('Peep!')
    expect(page).to have_content('You must sign in or sign up')
  end

  let (:user) do
    User.create(name: 'Ivan Sathianathan', username: 'ivan', email: 'ivan@test.com', password: '12345', password_confirmation: '12345')
  end

  scenario 'when signed in displays peep' do
    sign_in(username: user.username, password: user.password)
    visit '/peeps/new'
    fill_in('peep', with: 'Hello world!')
    click_button('Peep!')
    expect(page).to have_content('Hello world!')
  end
end
