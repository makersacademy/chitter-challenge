feature 'peeps' do
  let!(:user) do
    User.create(email: 'example@example.com',
                name: 'example',
                user_name: 'example',
                password: 'password',
                password_confirmation: 'password' )
  end

  before do
    sign_in(email: user.email, password: user.password)
    Peep.create(user_name: user.user_name, peep: 'five')
    Peep.create(user_name: user.user_name, peep: 'four')
    Peep.create(user_name: user.user_name, peep: 'three')
    Peep.create(user_name: user.user_name, peep: 'two')
    Peep.create(user_name: user.user_name, peep: 'one')
  end

  scenario 'users can see all peeps in reverse chronological order' do
    visit '/peeps/index'
    within('ul#peeps') do
      expect(page).to have_content('one')
      expect(page).to have_content('two')
      expect(page).to have_content('three')
      expect(page).to have_content('four')
      expect(page).to have_content('five')
    end
  end
end
