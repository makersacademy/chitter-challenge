feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Log in to Chitter"
  end

  feature 'viewing peeps' do
    scenario 'peeps are visible' do
      # Add the test data:
      Peep.create(title: 'UNTIL', author: 'Nelson Mandela', url: 'https://bit.ly/33ADu6u', message: "Hello world!")
      Peep.create(title: 'Something very big',author: 'Donald J Trump', url: 'https://bit.ly/34MAALX', message: "Hello world!")
      Peep.create(title: 'I am slow to learn', author: 'Abraham Lincoln', url: 'https://bit.ly/33AuU7P', message: "Hello world!")
      Peep.create(title: 'The secret of life.', author: 'Fela Kuti', url: 'https://bit.ly/3717kmS', message: 'Hello world!')


      visit('/peeps')
      expect(page).to have_link("UNTIL", href: 'https://bit.ly/33ADu6u')
      expect(page).to have_link("Something very big", href: 'https://bit.ly/34MAALX')
      expect(page).to have_link("I am slow to learn", href: 'https://bit.ly/33AuU7P')
      expect(page).to have_link("The secret of life", href: 'https://bit.ly/3717kmS')
    end
  end
end
