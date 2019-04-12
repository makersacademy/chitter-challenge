def sign_up
  visit '/'
  click_button 'Sign Up'
  fill_in(:email, with: 'test@example.com')
  fill_in(:password, with: 'password123')
  fill_in(:name, with: 'Test')
  fill_in(:username, with: 'Tester')
  click_button 'Sign up'
end


def test_peep
  visit '/'
  click_button 'Post Peep'
  fill_in('peep', with: 'Test Peep')
  click_button 'Post'
end

def test_peep2
  visit '/'
  click_button 'Post Peep'
  fill_in('peep', with: 'Test Peep 2')
  click_button 'Post'
end

def test_peep3
  visit '/'
  click_button 'Post Peep'
  fill_in('peep', with: 'Test Peep 3')
  click_button 'Post'
end
