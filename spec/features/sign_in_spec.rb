feature 'signing in' do 
  scenario 'user can sign in' do 
    sign_in
    expect(page).to have_content "Welcome, Triceratops"
  end
end