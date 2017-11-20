def post_a_peep
  visit '/peeps/new'
  fill_in 'content', with: 'blablabla!'
  click_button 'Post'
end

def post_another_peep
  visit '/peeps/new'
  fill_in 'content', with: 'second peep'
  click_button 'Post'
end

def current_time
  Time.now.strftime("%H:%M:%S %d/%m/%Y")
end

def sign_up
  visit "/user/new"
  fill_in :email, with: 'jo@gmail.com'
  fill_in :password, with: '0000'
  click_button 'Sign Up'
end
