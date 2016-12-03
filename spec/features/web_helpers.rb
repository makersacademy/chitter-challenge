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


def sign_in username: "realDjango",
            password: "i_hate_honkys"

  visit 'sessions/new'
  fill_in 'username', with: username
  fill_in 'password', with: password

  click_button 'submit'
end
