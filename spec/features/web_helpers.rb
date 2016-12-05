def sign_up name: "Django Tarantino",
            username: "realDjango",
            email: "django@unchained.com",
            password: "i_hate_honkys"

  visit '/users/new'
  fill_in 'name', with: name
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password

  click_button 'submit'
end


def sign_in username: "test_user",
            password: "passw0rd"

  visit 'sessions/new'
  fill_in 'username', with: username
  fill_in 'password', with: password

  click_button 'submit'
end

def sign_out
  visit '/sessions/delete'
  click_button 'Sign out'
end

def make_peep content
  visit '/peeps/new'
  fill_in 'post', with: content
  click_button 'submit'
end
