feature 'signing up' do
  scenario 'is taken to welcome page after signing up' do
    sign_up
    expect(page).to have_content("Welcome, macebake!")
  end
end

feature 'logging in' do
  scenario ''
end
