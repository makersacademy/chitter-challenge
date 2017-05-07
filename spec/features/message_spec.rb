feature 'Messages (peeps)' do
  let!(:user) do
    User.create(email: 'propeeper@email.com',
                username: 'manicstreetpeeper',
                name: 'Yono',
                password: 'shh999',
                password_confirmation: 'shh999')
  end
  scenario 'When logged in, a user can post a message' do
    log_in(email: user.email, password: user.password)
    fill_in :message, with: 'test peep'
    click_button 'Peep!'
    expect(current_path).to eq('/')
    expect(page).to have_content 'manicstreetpeeper peeped: test peep'
  end
end
