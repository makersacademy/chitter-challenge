feature 'posting peeps' do
  let!(:user) do
    User.create(email: 'example@example.com',
                name: 'example',
                user_name: 'example',
                password: 'password',
                password_confirmation: 'password' )
  end
  before do
    sign_in(email: user.email, password: user.password)
  end

  scenario 'user can post peeps after signing in' do
    expect{ peep }.to change(Peep, :count).by(1)

    within("ul#peeps") do
      expect(page).to have_content("example peep")
    end
  end

end
