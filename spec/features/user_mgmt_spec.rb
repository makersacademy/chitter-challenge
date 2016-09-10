require 'spec_helper'

feature 'User sign up' do
  scenario 'user can sign up with valid data' do
    # sign_up
    # expect(page).to have_content("Welcome John Smith")
    # expect(current_path).to eq '/messages'
  end

  scenario 'user cannot sign up with mismatchin password'

  scenario 'user cannot sign up with the same username twice'

  scenario 'user cannot sign up with no username'

  scenario 'user cannot sign up with no email address'

  scenario 'user cannot sign up with the same email address twice'

  scenario 'user cannot sign up with invalid email address'
end

feature 'User log in' do

end

feature 'User log out' do

end
