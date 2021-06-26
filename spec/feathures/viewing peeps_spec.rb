# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content ('Hello weekend!')
    expect(page).to have_content ('I love Chitter!')
    expect(page).to have_content ('Good Bye COVID-19!')
  end

  
end