feature 'signing up' do
  scenario 'user can sign up on the homepage' do
    visit '/'
    fill_in :name, with: 'catlover'
    fill_in :email, with: 'cat@cats.com'
    fill_in :password, with: 'ilovecats'
    fill_in :password_confirmation, with: 'ilovecats'
    click_button 'Sign up!'
    expect(page).to have_content("Welcome to Chitter, cat@cats.com")
  end

  scenario 'user cannot sign up if passwords do not match' do
    visit '/'
    fill_in :name, with: 'catlover'
    fill_in :email, with: 'cat@cats.com'
    fill_in :password, with: 'ilovecats'
    fill_in :password_confirmation, with: 'ilovedogs'
    click_button 'Sign up!'
    expect(current_path).to eq('/user/new')
    expect(page).to have_content("Passwords do not match")
  end
end
