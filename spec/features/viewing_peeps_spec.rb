feature 'Viewing peeps' do
  feature 'visiting the homepage' do
    scenario 'As an user, I can see the homepage' do
      visit '/'

      expect(page).to have_content 'Welcome! Please, enjoy our Chitter app!'
    end
  end

  feature 'Viewing peeps' do
    scenario 'As an user, I can see the peeps' do
      Peep.create(post: "Peep peep?")
      visit '/peeps'

      expect(page).to have_content 'Peep peep?'
    end
  end
end
