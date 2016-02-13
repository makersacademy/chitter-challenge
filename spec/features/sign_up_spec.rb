feature 'Users can sign-up' do
  scenario 'Users fill-in a form to sign-up' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter, bigbob'
  end

  scenario 'Users need a matching password confirmation' do
    expect{sign_up(password_confirmation: "bbbbb")}.not_to change(User, :count)
  end
  
end
