features 'Viewing peeps' do

  let(:jonny) do
    User.create(username: "jonnymoore",
            email: "jonnymoore@email.com",
            password: "remember_this"),
            password_confirmation: "remember_this")
  end

  scenario 'I can see all of peeps on a peeps page' do
    Peep.create(peep: 'Pogba to United?', user: jonny)
    visit '/peeps'
    within 'ul#links' do
      expect(page).to have_content "Pogba to United?"
    end
  end

end
