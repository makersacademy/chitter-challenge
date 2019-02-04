def long_peep
  " This is over 130 characters and should fail to save.
    This is over 130 characters and should fail to save.
    This is over 130 characters and should fail to save.
    This is over 130 characters and should fail to save.
    This is over 130 characters and should fail to save. "
end

def post_a_peep
  visit '/peeps'
  fill_in 'peep_entry', with: "This is a test peep!"
  click_on('Post')
end

def fill_in_sign_up_form
  within '.signup' do
    fill_in 'email', with: 'email@email.com'
    fill_in 'username', with: 'username'
    fill_in 'first_name', with: 'first_name'
    fill_in 'last_name', with: 'last_name'
    fill_in 'password', with: 'password'
    check 'agree'
    click_on 'Submit'
  end
end
