feature 'User can create a peep' do

  let!(:user) do
    User.create(name: 'test',
                user_name: 'test',
                email: 'test@test.com',
                password: '1234',
                password_confirmation: '1234')
  end

  scenario 'when I log in I can create a new peep' do
    sign_in(email: user.email, password: user.password)
    visit '/peeps/new'
    fill_in 'peep', with: 'beep beep beep'
    click_button 'Peep!'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('beep beep beep')
    end
  end
end
