def signup
  @random_username = ['and', 'andy'].sample
  visit '/'
  click_button 'Sign Up'
  fill_in 'username', with:  @random_username
  fill_in 'email',    with: 'and@me.com'
  fill_in 'password', with: 'monkey'
  fill_in 'name',     with: 'Andrea'
  fill_in 'surname',  with: 'Mazzarella'
  click_button 'Sign Up'
end

def signin
  visit '/'
  click_button 'Sign In'
  fill_in 'username', with: @random_username
  fill_in 'password', with: 'monkey'
  click_button 'Sign In'
end

def signin_wrong_password
  visit '/'
  click_button 'Sign In'
  fill_in 'username', with:  @random_username
  fill_in 'password', with: 'wrongpsw'
  click_button 'Sign In'
end

def signin_wrong_username
  visit '/'
  click_button 'Sign In'
  fill_in 'username', with: 'wrong_username'
  fill_in 'password', with: 'monkey'
  click_button 'Sign In'
end

def peep(message)
  click_button 'Peep'
  fill_in 'content', with: message
  click_button 'Peep'
end
