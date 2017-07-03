feature 'peeping' do

  let!(:user) do
    User.create(email: 'user12@example.com',
                firstname: 'Bubs',
                lastname: 'Bacon',
                username: 'bc23',
                password: 'password123',
                password_confirmation: 'password123')
  end

  scenario 'I would like to add a peep to chitter' do
    sign_in(email: user.email,   password: user.password)
    visit '/peeps/new'
    fill_in "peep", with: "profound observations"
    click_button "peep"

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('profound observations')
    end
  end

  scenario 'I cannot post a peep if I am not signed in' do
    expect{ post_peep }.not_to change(Peep, :count)
    expect(page).to have_content "You must be signed in to post a peep"
  end
end
