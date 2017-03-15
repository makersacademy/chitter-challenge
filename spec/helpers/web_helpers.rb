def create_peep(message:, media: nil, tag: nil)
  visit('/peeps')
  click_button 'Peep'
  fill_in 'message', with: message
  fill_in 'media', with: media unless media.nil?
  fill_in 'tags', with: tag unless tag.nil?
  click_button 'Send'
end

def sign_up(email:,handle:, name:, bio: nil, avatar: nil, password:, password_confirm: password)
  visit '/users/new'
  fill_in :email,    with: email
  fill_in :name,     with: name
  fill_in :handle,   with: handle
  fill_in :bio,      with: bio
  fill_in :avatar,   with: avatar
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirm
  click_button 'Sign Up'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign In'
end

def sign_out
  visit '/peeps'
  click_button 'Sign Out'
end
