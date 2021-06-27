
# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made


feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content ('Hello weekend!')
    expect(page).to have_content ('I love Chitter!')
    expect(page).to have_content ('Good Bye COVID-19!')
  end  
end