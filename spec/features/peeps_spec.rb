feature "Peeps" do
  before(:each) do
    User.create(name: 'Nick', user_name: 'nmrichards',
                email: 'batman@gmail.com', password: 'password',
                password_confirmation: 'password',
                peeps: [Peep.first_or_create(post: "My first post", time: Time.now )])
  end
  scenario "Peeps displayed on home screen" do
    visit('/')
    expect(page).to have_content('nmrichards wrote: My first post')
  end

  scenario "lets user post a peep" do
    visit('/')
    sign_in
    fill_in :peep, with: "AMMMERRRRIIICCAAA!!!"
    click_button 'Post'
    expect(page).to have_content('nmrichards wrote: AMMMERRRRIIICCAAA!!!')
  end
end
