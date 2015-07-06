feature 'User can choose to sign up or log in' do

  scenario 'user is initially taken to a welcome page' do
    visit '/'
    expect(page).to have_content 'Chitter'
  end

  scenario 'user clicks on log in and is taken to log in page' do
    visit '/'
    click_on 'Log in'
    expect(page).to have_selector('#log_in')
  end

  scenario 'user clicks on register and is taken to sign up page' do
    visit '/'
    click_on 'Register'
    expect(page).to have_selector('#register')
  end
end

feature 'User can sign up' do
  let (:user) do
    User.new(email: 'kate@email.com',
             password: '1234',
             username: 'kate',
             password_confirmation: '1234')
    end

  scenario 'user can sign up for chitter' do
    expect { register(user) }.to change(User, :count).by(1)
    expect(page).to have_content("You're logged in as kate")
    expect(User.first.email).to eq ('kate@email.com')
  end
end

feature 'User cannot sign up' do
  let (:user) do
    User.new(email: 'kate@email.com',
             password: '1234',
             username: 'kate',
             password_confirmation:'wrong')
  end

  scenario 'with a password confirmation that does not match' do
    expect { register(user) }.not_to change(User, :count)
    expect(page).to have_content('Password does not match the confirmation')
  end
end

feature 'User cannot sign up' do
  let (:user) do
    User.create(email: 'kate@email.com',
             password: '1234',
             username: 'kate',
             password_confirmation:'1234')
  end

  scenario 'with an already existing email' do
    register(user)
    expect { register(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

end

feature 'user can sign in with correct credentials' do
  let (:user) do
    User.new(email: 'kate@email.com',
             password: '1234',
             username: 'kate',
             password_confirmation: '1234')
  end

  scenario 'user can sign into their account' do
    register(user)
    sign_in(email:'kate@email.com', password:'1234')
    expect(page).to have_content "You're logged in as kate"
  end

  scenario 'user cannot sign in with incorrect credentials' do
    register(user)
    sign_in(email:'kate@email.com', password:'wrong')
    expect(page).to have_content 'The email or password is incorrect'
  end

end
