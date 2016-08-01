feature 'Viewing messages' do
    let!(:user) do
     User.create(email: 'test@test.com', password: '12345', name: 'Bob', username: 'Bob12345',
                password_confirmation: '12345')
    end

    scenario 'I can see messages on the homepage' do
    Message.create(message: "Hello", user: user)
    visit '/'
    expect(page.status_code).to eq 200
    within 'ul#messages' do
      expect(page).to have_content("Hello")
    end
  end
end
