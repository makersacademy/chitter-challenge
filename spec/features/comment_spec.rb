feature '/comment' do 
  scenario 'allows users to comment' do 
    User.create(name: 'Test User', email: 'test@example.com', password: 'password123')

    login
    fill_in 'comment', with: 'Hello World'
    click_on 'comment'
    expect(page).to have_content 'Hello World'
  end
end 
