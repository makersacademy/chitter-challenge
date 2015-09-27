feature "User sign up" do

  def sign_up(name: 'Person',
              username: 'pers0n',
              email: 'person@example.com',
              password: 'bananas!')
    visit 'users/sign_up'
    expect(page.status_code).to eq(200)
    fill_in :name,     with: name
    fill_in :username, with: username
    fill_in :email,    with: email
    fill_in :password, with: password
    click_button 'Sign up for Chitter'
  end

  scenario 'I can sign up as a new user' do

    expect { sign_up }.to change(User, :count).by(1)
    # expect(page).to have_content('Welcome, Person')
    expect(User.first.email).to eq('person@example.com')
  end

end
