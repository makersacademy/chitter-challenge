feature 'Viewing peeps' do

  let!(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'I want to see todays date on a tweet I create' do
    sign_in(email: user.email,  password: user.password)
    send_a_peep


      expect(page).to have_content "I am a stupid and vapided peeper"

  end
end
