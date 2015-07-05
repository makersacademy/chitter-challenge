feature 'Creating peeps' do
  let (:user) do
    User.create(email: 'kate@email.com',
                password: '1234',
                username: 'kate')
  end

  scenario 'I can create a new peep' do
    register(user)
    visit '/peeps/new'
    fill_in 'message', with: 'test message'
    click_button 'Create peep'
    expect(current_path).to eq '/peeps'

    within 'ul#messages' do
      expect(page).to have_content('test message')
    end
  end

  scenario 'There are no messages in the database at the start of the test' do
    expect(Peep.count).to eq(0)
  end

end