feature 'Viewing peeps' do
  let (:user) do
    User.create(email: 'kate@email.com',
                password: '1234',
                password_confirmation: '1234',
                username: 'kate')
  end

  scenario 'I can see existing peeps on the peeps page' do
    register(user)
    Peep.create(message: 'first message', created_at: DateTime.now, user_id: user.id)
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#messages' do
      expect(page).to have_content('first message')
    end
  end
end