feature 'Viewing peeps' do
  scenario 'visiting a list of peeps' do

    Peep.create(message: 'Grrr, aarf aarf!')
    Peep.create(message: 'Hot Diggity!')

    visit('/view_peeps')
    expect(page).to have_content 'Grrr, aarf aarf!'
  end
end
