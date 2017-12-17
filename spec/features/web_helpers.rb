def login_as_Arbik
  fill_in 'username', with: 'Arbik'
  fill_in 'password', with: 'pythagoras'
  click_button 'Login'
end

def login_as_Arbik_wong_password
  fill_in 'username', with: 'Arbik'
  fill_in 'password', with: 'oopsydaisy'
  click_button 'Login'
end

def login_as_Arbik_wong_username
  fill_in 'username', with: 'Arbick oh no!'
  fill_in 'password', with: 'pythagoras'
  click_button 'Login'
end

def submit_peep
  fill_in 'peep', with: 'testing'
  click_button 'peep'
end

def submit_peep_2
  fill_in 'peep', with: 't3sting2'
  click_button 'peep'
end

def fill_in_sign_up_form
  fill_in 'user_name', with: 'TEST'
  fill_in 'email', with: 'TEST@hotmail.com'
  fill_in 'password', with: 'testing00'
  fill_in 'confirm_password', with: 'testing00'
  click_button 'Sign up!'
end

def fill_in_sign_up_form_as_second
  fill_in 'user_name', with: 'Arbik'
  fill_in 'email', with: 'Arbik@gmail.com'
  fill_in 'password', with: 'pythagoras'
  fill_in 'confirm_password', with: 'pythagoras'
  click_button 'Sign up!'
end

def fill_in_sign_up_with_short_password
  fill_in 'user_name', with: 'LucyLu'
  fill_in 'email', with: 'LL@msn.co.uk'
  fill_in 'password', with: 'genzo'
  fill_in 'confirm_password', with: 'genzo'
  click_button 'Sign up!'
end

def fill_in_sign_up_without_confirm
  fill_in 'user_name', with: 'LucyLu'
  fill_in 'email', with: 'LL@msn.co.uk'
  fill_in 'password', with: 'Gei$uXvv'
  fill_in 'confirm_password', with: 'oops forgot!'
  click_button 'Sign up!'
end

def fill_in_sign_up_with_no_email
  fill_in 'user_name', with: 'Joxboxer'
  fill_in 'email', with: ''
  fill_in 'password', with: 'JoxxinTT'
  fill_in 'confirm_password', with: 'JoxxinTT'
  click_button 'Sign up!'
end

def fill_in_sign_up_with_incorrect_email_format
  fill_in 'user_name', with: 'Joxboxer'
  fill_in 'email', with: 'jjj.com'
  fill_in 'password', with: 'JoxxinTT'
  fill_in 'confirm_password', with: 'JoxxinTT'
  click_button 'Sign up!'
end

def fill_in_sign_up_with_common_email1
  fill_in 'user_name', with: 'DavieBones'
  fill_in 'email', with: 'barb@hotmail.com'
  fill_in 'password', with: '89898989'
  fill_in 'confirm_password', with: '89898989'
  click_button 'Sign up!'
end

def fill_in_sign_up_with_common_email2
  fill_in 'user_name', with: 'RichieAprile'
  fill_in 'email', with: 'barb@hotmail.com'
  fill_in 'password', with: 'xui99tooth'
  fill_in 'confirm_password', with: 'xui99tooth'
  click_button 'Sign up!'
end

def fill_in_sign_up_without_username
  fill_in 'user_name', with: ''
  fill_in 'email', with: '090@msn.co.uk'
  fill_in 'password', with: 'doggobarko'
  fill_in 'confirm_password', with: 'doggobarko'
  click_button 'Sign up!'
end

def fill_in_sign_up_with_common_username1
  fill_in 'user_name', with: 'Dragonfire'
  fill_in 'email', with: 'drake@hotmail.com'
  fill_in 'password', with: 'Malygos99'
  fill_in 'confirm_password', with: 'Malygos99'
  click_button 'Sign up!'
end

def fill_in_sign_up_with_common_username2
  fill_in 'user_name', with: 'Dragonfire'
  fill_in 'email', with: 'firefly@gmail.com'
  fill_in 'password', with: 'D3ATHWING'
  fill_in 'confirm_password', with: 'D3ATHWING'
  click_button 'Sign up!'
end
