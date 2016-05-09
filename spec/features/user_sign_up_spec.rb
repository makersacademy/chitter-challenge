feature 'sign up to chitterchatter' do
  scenario 'I can sign up as a new user' do
    sign_up
    #expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, harry@smith.com')
    #expect(User.first.email).to eq('harry@smith.com')
  end

  scenario 'requires a matching confirmation password' do
    visit '/users/new'

    expect {sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
  end

end
