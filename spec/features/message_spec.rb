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
    expect { fill_in :message, with: 'test peep'; click_button 'Peep!' }.to change(Message, :count).by 1
    expect(current_path).to eq('/')
    expect(page).to have_content 'manicstreetpeeper peeped: test peep'
  end

  scenario 'message content is required to make a post' do
    log_in(email: user.email, password: user.password)
    expect { click_button 'Peep!' }.not_to change(Message, :count)
  end

  scenario 'must be logged in to peep' do
    expect(page).not_to have_selector('input[type=submit][value="Peep!"]')
  end
end
