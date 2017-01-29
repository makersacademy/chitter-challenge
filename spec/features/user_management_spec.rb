

feature 'User sign out' do
  let!(:user) do
    User.create(full_name: 'test user',
                username: 'test',
                email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'user should be able to read peeps without signing in' do
    visit '/'
    click_button 'Read peeps'
    expect(page.current_path).to eq '/read_peep'
  end
end
