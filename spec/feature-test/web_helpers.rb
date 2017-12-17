def peep_first
  visit '/peeps/new'
  fill_in 'msg', with: "Hi, this is peep1"
  click_button 'Create peep'
end

def peep_second
  visit '/peeps/new'
  fill_in 'msg', with: "Hi, this is peep2"
  click_button 'Create peep'
end

def peep_third
  visit '/peeps/new'
  fill_in 'msg', with: "Hi, this is peep3"
  click_button 'Create peep'
end
# def sign_up
#   visit '/users/new'
#   expect(page.status_code).to eq(200)
#   fill_in :email,    with: 'lea@example.com'
#   fill_in :password, with: 'oranges!'
#   click_button 'Sign up'
# end

def sign_up(email: 'lea@example.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
end
