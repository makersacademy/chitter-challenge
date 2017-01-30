feature 'View Peeps' do

  let(:user) { User.create(email: "test@test.com", password: 'password', password_confirmation: 'password') }


  scenario 'get all peeps' do

    peep = Peep.create(content: 'This is my peep', user_id: user.id)
    visit('/')
    expect(page.status_code).to eq 200

    within(:css, 'ul#peeps') { expect(page).to have_content(peep.content) }
  end
end
