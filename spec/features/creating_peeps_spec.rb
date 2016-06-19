feature 'Creating new peeps' do

  let!(:user) do
    User.create(name: 'test',
                username: 'test',
                email: 'test@test.com',
                password: '1234',
                password_confirmation: '1234')
  end

  scenario 'I can create a new peep if signed in' do
    sign_in(user.username, user.password)
    visit('/peeps/new')
    fill_in('message', with: 'Test')
    click_button('Post')
    expect(current_path).to eq('/peeps')
    within 'ul#peeps' do
      expect(page).to have_content('Test')
    end
  end

  scenario 'You can see the author of the peep' do

  end
end
