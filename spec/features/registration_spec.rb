feature 'registrations' do 
  scenario 'user can sign up and be signed in' do 
    visit('/')
    fill_in('name', with: 'maverick')
    fill_in('email', with: 'maverick@hotmail.co.uk')
    fill_in('password', with: 'blah')
  end
end