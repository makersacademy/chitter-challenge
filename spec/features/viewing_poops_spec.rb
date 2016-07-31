feature 'Viewing poops' do
  let!(:user) do
    User.create(email: 'tommy@testy.com', username: 'tommytest', password: 'qwerty', password_confirmation: 'qwerty')
  end

  scenario 'I can see existing poops on the poops page' do
    sign_in(email: user.email, password: user.password)
    Poop.create(content: 'My first ever poop on sh*tter')

    visit '/poops'
    expect(page.status_code).to eq 200

    within 'ul#poops' do
      expect(page).to have_content('My first ever poop on sh*tter')
    end
  end
end
