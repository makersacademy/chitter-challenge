feature 'sign up' do
  scenario 'user visits sign up page and can sign up' do
    sign_up('timmy')
    expect(page).to have_content('Hello, timmy!')
  end

  scenario 'wrong confirmation password does not create new user' do
    expect { sign_up_password_mismatch }.to change { User.all.count }.by(0)
  end

  scenario 'user has peeps associated with them' do
    sign_up('timmy')
    post_peep('Hi there!')
    post_peep('Hello!')
    post_peep('My third peep!')
    expect(User.first.peeps.map(&:text)).to include('Hi there!', 'Hello!', 'My third peep!')
  end
end
