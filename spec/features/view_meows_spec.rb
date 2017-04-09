feature 'view meows' do

  let!(:user) do
    User.create(email: 'cat@cat.com',
                name: 'saucy cat',
                username: 'cat',
                password: 'cat',
                password_confirmation: 'cat')
  end

  scenario 'see meows on homepage' do
    Meow.create(message: 'Hey kitty girl!', user: user, time: ('2017-04-09 00:00:00 +0100'))
    visit '/meows'
    expect(page.status_code).to eq 200

    within 'ul#meows' do
     expect(page).to have_content('Hey kitty girl!')
    end
  end
end
