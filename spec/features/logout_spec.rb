feature 'User logs out' do

  let(:user) do
    User.create(name: 'Bob',
                username: 'bobross',
                email: 'bob@ross.com',
                password: 'bobross',
                password_confirmation: 'bobross')
  end

  scenario 'While logged in' do
    sign_in(username: 'bobross', password: 'bobross')
    click_button "Logout"
    expect(page).to have_content('See ya later!')
    expect(page).not_to have_content('Hi, Bob!')
  end

end
