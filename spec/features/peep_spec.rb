feature 'Viewing peeps' do

  scenario 'user can see existing peeps on the peep page' do

    Peep.create(message: 'Hello, this is my first peep!!')

    visit '/peeps'

    expect(page).to have_content('Hello, this is my first peep!!')

  end
end