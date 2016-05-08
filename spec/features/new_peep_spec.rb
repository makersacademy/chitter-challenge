feature 'post new peep' do

  let(:user) do
    User.create(name: 'Robin Heathcote',
                username: 'robin1',
                email: 'robin@example.com',
                password: 'oranges!',
                password_confirmation: 'oranges!')
  end

  scenario 'allows signed in user to post a new peep' do
    sign_in(username: user.username,   password: user.password)
    visit '/peeps/new'
    fill_in :peep,   with: 'This is my first peep'
    click_button 'Peep!'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('This is my first peep')
      expect(page).to have_content("#{user.name}")
      expect(page).to have_content("#{user.username}")
    end
  end
end
