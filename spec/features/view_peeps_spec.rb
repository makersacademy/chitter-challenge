feature 'View posts' do

  let!(:user) do
    User.create(name: 'Robert',
                username: 'robbo',
                email: 'robert@robert.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'See existing peeps' do
    Post.create(user: user,
                message: 'This is a Peep',
                created_at: Time.now)
    visit '/posts'
    expect(page.status_code).to eq(200)

    within 'ul#posts' do
      expect(page).to have_content 'This is a Peep'
    end
  end
end
