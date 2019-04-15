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

def test_peep_with_tag
  visit '/'
  click_button 'Post Peep'
  fill_in('peep', with: 'Test Peep')
  fill_in('taggeduser', with: 'TagTester')
  click_button 'Post'
end

def test_peep_with_tag2
  visit '/'
  click_button 'Post Peep'
  fill_in('peep', with: 'Test Peep2')
  fill_in('taggeduser', with: 'TagTester')
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

def test_reply_with_tag
  visit '/peeps'
  click_button 'Reply'
  fill_in('reply', with: 'TestReply')
  click_button 'Reply!'
end
