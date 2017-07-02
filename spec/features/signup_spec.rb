feature 'correct signup' do
  scenario 'new user can sing up' do
    expect { signup_correct }.to change { User.count }.by(1)
  end
  
  scenario 'new user redirected to /peeps/index page' do
    signup_correct
    expect(page).to have_current_path('/peeps/index')
  end
  
  scenario 'new users sees welcome message' do
    signup_correct
    expect(page).to have_content('Welcome, john the great. ')
  end
end

feature 'incorrect signup' do
  
  scenario 'no user is added password doesn\'t match password confirmation' do
    expect { signup_incorrect }.to change { User.count }.by(0)
  end
  
  scenario 'user stays on the same page' do
    signup_incorrect
    expect(page).to have_current_path('/users/new')
  end
  
  scenario 'user sees error message' do
    signup_incorrect
    expect(page).to have_content('Password does not match the confirmation')
  end
  
  scenario 'password is less than 6 characters long' do
    signup_incorrect
    expect(page).to have_content('Password must be between 6 and 8 characters long')
  end
  
  scenario 'duplicate email' do
    signup_correct
    signup_repeat
    expect(page).to have_content('Email is already taken')
    expect(page).to have_content('User name is already taken')
  end
  
end
