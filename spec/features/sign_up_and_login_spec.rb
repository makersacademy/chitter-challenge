feature 'registration' do
  scenario 'a user can sign up' do
    sign_up(name:'Test Person',handle:'@mrtest',email:'test@example.com',password:'password123')
    expect(page).to have_content "Welcome Test Person - @mrtest"
  end
end
