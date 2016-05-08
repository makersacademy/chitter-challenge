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
    User.create(name: "jack",username: "jackhardy1",email:"jackhardy1@gmail.com",password:"jackhardy2110")
    visit '/'
    click_button 'log in'
    fill_in 'username', with: 'jackhardy1'
    fill_in 'password', with: 'jackhardy2110'
    click_button 'submit'
    expect(page).to have_content "Welcome jackhardy1"
  end

  scenario 'user cannot sign in with incorrect password' do
    User.create(name: "jack",username: "jackhardy1",email:"jackhardy1@gmail.com",password:"jackhardy2110")
    visit '/'
    click_button 'log in'
    fill_in 'username', with: 'max202'
    fill_in 'password', with: 'max202'
    click_button 'submit'
    expect(current_path).to eq '/log_in'
  end
end

feature 'peeping' do
  scenario 'user can add peep' do
    User.create(name: "jack",username: "jackhardy1",email:"jackhardy1@gmail.com",password:"jackhardy2110")
    visit '/'
    click_button 'log in'
    fill_in 'username', with: 'jackhardy1'
    fill_in 'password', with: 'jackhardy2110'
    click_button 'submit'
    fill_in 'title', with: "Makers"
    fill_in 'content', with: "Makers is great"
    click_button 'submit'
    expect(page).to have_content "Title: Makers"
    expect(page).to have_content "Content: Makers is great"
    expect(page).to have_content "Author: jackhardy1"
  end
end
