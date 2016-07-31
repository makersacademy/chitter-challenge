feature 'posting peeps' do
  let!(:user) do
    User.create(email: 'example@example.com',
                user_name: 'example',
                password: 'password',
                password_confirmation: 'password' )
  end

  before do
    sign_in(email: user.email, password: user.password)
  end

  scenario 'user can post peeps after signing in' do
    fill_in :peep, with: 'This is a test peep'
    click_button 'Peep'

    within("ul#peeps") do
      expect(page).to have_content("This is a test peep")
    end
  end

end
