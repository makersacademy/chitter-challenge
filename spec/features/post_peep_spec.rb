feature 'post peep' do

  let!(:user) do
    User.create(username: 'toby123',
                name: 'Toby m-l',
                email: 'toby@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'has a post peep button on the home page' do
    sign_in(email: user.email,   password: user.password)
    expect(current_path).to eq('/')
    click_button('Post a new Peep!')
    fill_in :content, with: 'Hello this is a new post'
    click_button 'Submit Peep'
  end

  scenario 'posts a peep and displays it on the web page' do
    sign_in(email: user.email,   password: user.password)
    expect(current_path).to eq('/')
    click_button('Post a new Peep!')
    fill_in :content, with: 'Hello this is a new post'
    click_button 'Submit Peep'
      within 'ul#peeps' do
        expect(page).to have_content 'Hello this is a new post'
      end
  end

  scenario 'expects page to show who wrote it' do
    sign_in(email: user.email,   password: user.password)
    expect(current_path).to eq('/')
    click_button('Post a new Peep!')
    fill_in :content, with: 'Hello this is a new post'
    click_button 'Submit Peep'
      within 'ul#peeps' do
        expect(page).to have_content 'toby123'
      end
  end

end
