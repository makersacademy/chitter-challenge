feature 'viewing peeps' do
  scenario 'should be able to see peeps from the landing page' do
    User.create(usr:'testy', pass:'testy_secure', email:'test@test.com')
    who = User.all[-1].id
    Peep.create(text: "you are beginnning to test me you know", user: who)
    visit('/')
    expect(page).to have_content("you are beginning to test me you know")
    expect(page).to have_content("testy")
    expect(page).to have_content(Peep.all[0].time)
  end
end