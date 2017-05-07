require './spec/web_helpers'

feature "tests for user validation" do

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'roger@rf.com',
              password: 'goldenjacket',
              password_confirmation: 'goldenjacket')
    visit('/users/new')
    fill_in :name, with: "Roger Federer"
    fill_in :username, with: "roger_federer"
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

end
