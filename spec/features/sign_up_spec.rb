feature 'signing up' do
  scenario 'users can enter email, password, name and username' do
    visit('/')
    click_link('Sign up')
    fill_in('email', with: 'example@email.com')
    fill_in('password', with: 'password')
    fill_in('name', with: 'Jozef Bloggs')
    fill_in('username', with: 'JoBlo123')
    click_on 'OK'
    expect(current_path).to eq '/'
  end
end
