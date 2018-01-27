feature 'signing up' do
  scenario 'user can sign up on the homepage' do
    visit '/'
    fill_in :name, with: 'catlover'
    fill_in :email, with: 'cat@cats.com'
    fill_in :password, with: 'ilovecats'
    click_button 'Sign up!'
    # fill_in :password_confirm, with: ilovecats
    expect(page).to have_content("Welcome to Chitter, catlover")
  end
end
