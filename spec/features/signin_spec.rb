RSpec.feature 'Sign in' do
  scenario 'user can sign in' do 
    signup_and_submit
    signin_and_submit 
  end 
end