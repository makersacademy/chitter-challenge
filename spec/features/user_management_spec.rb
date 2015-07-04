feature 'User can sign up' do

  let(:user) do
    build(:user)
  end

  scenario 'as a new user' do
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, #{user.name}")
    expect(User.first.email).to eq("#{user.email}")
  end

  # scenario 'I can sign up as a new user' do
  #   expect { sign_up }.to change(User, :count).by(1)
  #   expect(page).to have_content('Welcome, alice@example.com')
  #   expect(User.first.email).to eq('alice@example.com')
  # end
  #
  # def sign_up(email: 'alice@example.com',
  #             password: 'oranges!')
  #   visit '/users/new'
  #   expect(page.status_code).to eq(200)
  #   fill_in :email,    with: email
  #   fill_in :password, with: password
  #   click_button 'Sign up'
  # end


end
