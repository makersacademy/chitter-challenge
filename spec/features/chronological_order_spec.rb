feature 'peep order' do
  scenario 'peeps listed on the homepage are in chronological order' do
      peep1 = Peep.create(body: 'first peep', author: 'Admin')
      peep2 = Peep.create(body: 'second peep', author: 'Admin')

      visit '/'
      expect(peep2.body).to appear_before(peep1.body)
  end
end
