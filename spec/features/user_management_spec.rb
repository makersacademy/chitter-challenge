require './spec/factories/user'

feature 'User sign up' do 

  scenario 'I can sign up as a new user' do 
    user = build :user
    sign_up_as(user)
    expect { click_button('Sign up') }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, dbatten')
    expect(User.first.email).to eq('dom@example.com')
  end

  scenario 'Requires a matching password' do
    user = build :user
    sign_up_as(user)
    fill_in :password_confirmation, with: 'wrong'
    expect { click_button('Sign up') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up with an existing email' do 
    user = create :user
    sign_up_as(user)
    expect { click_button('Sign up') }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end 

  # def sign_up(email: 'dom@example.com',
  #           name: 'dom',
  #           username: 'dbatten',
  #           password: '123',
  #           password_confirmation: '123')
  #   visit '/users/new'
  #   expect(page.status_code).to eq(200)
  #   fill_in :email,    with: email
  #   fill_in :name,    with: name
  #   fill_in :username,    with: username
  #   fill_in :password, with: password
  #   fill_in :password_confirmation, with: password_confirmation
  #   click_button 'Sign up'
  # end

end