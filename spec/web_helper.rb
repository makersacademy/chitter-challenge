def sign_in(mail:,password:)
		visit '/sessions/log-in'
		fill_in :mail,    with: mail
		fill_in :password, with: password
		click_button 'Sign in'
end