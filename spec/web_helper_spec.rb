def add_test_peeps
  visit '/'
  fill_in('peep', with: "Now I've had the time of my life. No, I never felt like this before")
  click_on 'Submit'
  fill_in('peep', with: "Yes, I swear it's the truth. And I owe it all to you")
  click_on 'Submit'
  fill_in('peep', with: "Cause I've had the time of my life. And I owe it all to you")
  click_on 'Submit'
end

def add_user
  described_class.add('Lizzy', 'eballantine', 'lizzy@hey.com', 'Password123')
end
