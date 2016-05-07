feature 'signing up to chitter' do
  scenario 'user can sign up and stores info to database' do
    visit '/'
    click_button 'sign up'
    expect(current_path).to eq '/sign_up'
    fill_in 'name', with: "jack"
    fill_in 'username', with: 'jackhardy1'
    fill_in 'email', with: 'jackhardy1@gmail.com'
    fill_in 'password', with: 'jackhardy1'
    expect{click_button 'submit'}.to change(User, :count).by(1)
  end
end

feature 'signing in to chitter' do
  scenario 'user can sign in with correct password' do
    visit '/'
    click_button 'sign up'
    expect(current_path).to eq '/sign_up'
    fill_in 'name', with: "jack"
    fill_in 'username', with: 'jackhardy1'
    fill_in 'email', with: 'jackhardy1@gmail.com'
    fill_in 'password', with: 'jackhardy1'
    click_button 'submit'
    click_button 'log in'
    fill_in 'username', with: 'jackhardy1'
    fill_in 'password', with: 'jackhardy1'
    click_button 'submit'
    expect(page).to have_content "Welcome jackhardy1"
  end

  scenario 'user cannot sign in with incorrect password' do
    visit '/'
    click_button 'sign up'
    expect(current_path).to eq '/sign_up'
    fill_in 'name', with: "jack"
    fill_in 'username', with: 'jackhardy1'
    fill_in 'email', with: 'jackhardy1@gmail.com'
    fill_in 'password', with: 'jackhardy1'
    click_button 'submit'
    click_button 'log in'
    fill_in 'username', with: 'jackhardy1'
    fill_in 'password', with: 'jackhardy1'
    click_button 'submit'
  end
end



feature 'peeping' do
  scenario 'user can add peep' do
    visit '/logged_in'
    fill_in 'title', with: "Makers"
    fill_in 'content', with: "Makers is great"
    click_button 'submit'
    expect(page).to have_content "Title: Makers"
    expect(page).to have_content "Content: Makers is great"
  end
end

feature ''
