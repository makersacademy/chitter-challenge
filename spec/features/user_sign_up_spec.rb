feature 'sign up to chitterchatter' do
  scenario 'I can sign up as a new user' do
    visit '/users/new'
    #expect { sign_up }.to change(User, :count).by(1)
    fill_in :email, with: 'harry@smith.com'
    fill_in :password, with: '3613'

    click_button 'Sign up'
    #expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, harry@smith.com')
    #expect(User.first.email).to eq('harry@smith.com')
  end
end
