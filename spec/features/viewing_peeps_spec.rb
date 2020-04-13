feature 'viewing peeps' do
  scenario 'should be able to see peeps from the landing page' do
    User.create(usr:'testy', pass:'testy_secure', email:'test@test.com', name: 'testes')
    who = User.all[-1].id
    p who
    Peep.create(text: "you are beginning to test me you know", user: who)
    visit('/')
    click_button('sign in')
    fill_in('username', with: 'testy')
    fill_in('password', with: 'testy_secure')
    click_button('log in')
    expect(page).to have_content("you are beginning to test me you know")
    expect(page).to have_content("testy")
    expect(page).to have_content(Peep.all[0].time)
  end
end