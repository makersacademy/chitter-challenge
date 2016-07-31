feature 'Posting poops' do
  let!(:user) do
    User.create(email: 'tommy@testy.com', username: 'tommytest', password: 'qwerty', password_confirmation: 'qwerty')
  end

  scenario 'I can post a new poop' do
    sign_in(email: user.email, password: user.password)
    visit '/poops/new'
    fill_in 'content',   with: "My first ever poop on sh*tter!"
    click_button 'Post Poop'

    expect(current_path).to eq '/poops'

    within 'ul#poops' do
      expect(page).to have_content("My first ever poop on sh*tter!")
    end
  end
end
