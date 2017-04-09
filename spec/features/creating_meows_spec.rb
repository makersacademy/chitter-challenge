feature 'Creating meows' do
  let!(:user) do
    User.create(email: 'cat@cat.com',
                name: 'saucy cat',
                username: 'cat',
                password: 'cat',
                password_confirmation: 'cat')
  end

  scenario 'form enables kitty to submit a new meow' do
    sign_in(username: user.username, password: user.password)
    visit '/meows/new'
    fill_in(:message, with: 'Cat')
    click_button('Send meow!')
    expect(current_path).to eq '/meows'

    within 'ul#meows' do
      expect(page).to have_content('Cat')
    end
  end

  scenario "I can't create a meow if I'm not signed in" do
    visit '/meows/new'
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content "You must sign in to meow"
  end
end
