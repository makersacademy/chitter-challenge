feature 'Viewing peeps' do
  scenario 'User goes to Chitter main page to view peeps' do
    visit('/peeps')

    expect(page).to have_content "Peep 1 by Pusheen"
    expect(page).to have_content "Peep 2 by Gudetama"
    expect(page).to have_content "Peep 3 by Yoda"
  end
end
