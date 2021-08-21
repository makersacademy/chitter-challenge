def add_test_peeps
  visit '/'
  fill_in('Peep:', with: "Now I've had the time of my life. No, I never felt like this before")
  click_on 'Submit Peep'
  fill_in('Peep:', with: "Yes, I swear it's the truth. And I owe it all to you")
  click_on 'Submit Peep'
  fill_in('Peep:', with: "Cause I've had the time of my life. And I owe it all to you")
  click_on 'Submit Peep'
end

def add_user
  described_class.add(
    'Lizzy', 
    'eballantine', 
    'lizzy@hey.com', 
    'Password123')
end

def sign_up_user
  visit '/'
  click_on('Sign Up')
  fill_in 'name', with: 'Gram Parsons'
  fill_in 'username', with: 'flyingBurrito'
  fill_in 'email', with: 'cecil3@gmail.com'
  fill_in 'password', with: 'Emmylou123'
  click_on('Sign Me Up!')
  click_on('Sign Out')
end

def user_sign_in
  sign_up_user
  click_on('Sign In')
  fill_in 'email', with: 'cecil3@gmail.com'
  fill_in 'password', with: 'Emmylou123'
  click_on('Sign Me In!')
end