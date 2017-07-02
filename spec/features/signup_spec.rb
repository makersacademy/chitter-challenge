feature 'signup' do
  scenario 'new user can sing up' do
    expect { signup_correct }.to change { User.count }.by(1)
  end
  
  scenario 'new user redirected to /peeps/index page' do
    signup_correct
    expect(page).to have_current_path('/peeps/index')
  end
  
  scenario 'new users sees welcome message' do
    signup_correct
    expect(page).to have_content( 'Welcome, john the great. ')
  end
end
