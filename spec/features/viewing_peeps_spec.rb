feature 'Viewing peeps' do

  let(:jonny) do
    User.create(username: "jonnymoore",
            email: "jonnymoore@email.com",
            password: "remember_this",
            password_confirmation: "remember_this")
  end

  scenario 'I can see all peeps on a peeps page' do
    log_in(email: "jonnymoore@email.com", password: "remember_this")
    Peep.create(peep: 'Pogba to United?', user: jonny)
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content "Pogba to United?"
    end
  end

end
