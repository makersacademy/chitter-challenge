feature 'Peeping' do

  before(:each) do
    User.create(name: 'Joe',
                user_name: 'Joe123',
                email: 'joe@example.com',
                password: 'secret')
  end

  scenario 'when signed in I can peep people' do
    sign_in(email: 'joe@example.com',   password: 'secret')
    click_link 'New peep'
    fill_in :message, with: 'First peep'
    click_button 'Peep'
    expect(page).to have_content 'First peep'
  end
end
