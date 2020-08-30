feature 'Viewing Peeps' do
  feature 'visiting the homepage' do
    scenario 'can see the title' do
      visit '/'

      expect(page).to have_content 'Welcome to Chitter'
    end
  end

  feature 'viewing Peeps' do
    scenario 'can see the Peeps' do
      Peep.create(post: "Might be a Peep here", poster: '@tester', poster_name: 'Mr Test')
      visit '/peeps'

      expect(page).to have_content 'Might be a Peep here'
    end
  end
end
