feature 'replying to a peep' do
   before(:each) do
    User.create(email:'test@test.com',
            password:'12345',
            password_confirmation:'12345',
            name:'test_name',
            username:'user_numero_uno')
  end

  scenario 'takes us to a reply page' do
    add_peep
    visit '/'
    click_link 'reply'
    expect(current_path).to eq '/reply/2'
  end

  scenario 'if we are not logged in we cant reply' do
    add_peep
    visit '/'
    click_link 'reply'
    expect(page).to have_content('you need to be logged in to reply') 
  end

  scenario 'if we are logged in we can reply' do
    sign_in
    add_peep
    visit '/'
    click_link 'reply'
    expect(page).not_to have_content('you need to be logged in to reply')
    fill_in(:reply, with:'interesting')
    click_button 'reply'
    expect(current_path).to eq '/'
    expect(page).to have_content 'interesting'
  end

end

def add_peep content = 'test'
  post = Peep.create(content: content, time: Time.new)
end

def sign_in(email = 'test@test.com', password='12345')
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'log in'
end