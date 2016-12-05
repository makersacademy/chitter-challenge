def signup
  visit '/users/new'
  fill_in('username', with: 'Miko')
  fill_in('email', with: 'miko@o2.pl')
  fill_in('password', with: 'gweatonidas36')
end

def sign_in
  visit '/sessions/new'
  fill_in('username', with: 'Miko')
  fill_in('password', with: 'gweatonidas36')
  click_button('Submit')
end

def post_message
  visit '/messages/new'
  fill_in('new_message', with: "Hello world!")
  click_button('Chirp!')
end

def signup_two
  visit '/users/new'
  fill_in('username', with: 'Zuza')
  fill_in('email', with: 'zuza@wp.pl')
  fill_in('password', with: 'aLaska666')
  fill_in('password_confirmation', with: 'aLaska666')
  click_button('Submit')
end

def sign_in_two
  visit '/sessions/new'
  fill_in('username', with: 'Zuza')
  fill_in('password', with: 'aLaska666')
  click_button('Submit')
end

def post_message_two
  visit '/messages/new'
  fill_in('new_message', with: "I love drag race!")
  click_button('Chirp!')
end
