require 'pg'

feature ' sign up' do
  scenario 'user can sign up for a chitter account' do
    visit ('/')
    fill_in('name', with: 'Camilla Greene')
    fill_in('username', with: 'cgreene') 
    fill_in('emailaddress', with: 'cgreene@mail.com') 
    fill_in('password', with: 'password') 
    click_button('Submit')
    visit ('/')

    expect(page).to have_content "Welcome to Chitter"
  end
end

