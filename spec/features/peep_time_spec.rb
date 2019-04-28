feature 'peep has a time of creation' do
  scenario 'peep is shown with time' do
    visit '/create_account'
    fill_in 'name', with: "Hannah"
    fill_in 'password', with: "password123"
    fill_in 'email', with: "test@gmail.com"
    click_button 'Create Account'
    visit '/home'
    click_button 'New Peep'
    fill_in 'post', with: "Hello, chitter!"
    click_button 'Post'
    time = Time.new.strftime("%d/%m %H:%M")
    expect(page).to have_content "#{time}"
  end
end
