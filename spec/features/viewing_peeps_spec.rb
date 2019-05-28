# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

# As a maker
# So that I can see what others are saying
# I want to see all peeps

feature 'Viewing peeps' do

  before do
      visit('/users/new')
      fill_in('email', with: 'peeper@peep.com')
      fill_in('password', with: '123')
      fill_in('name', with: 'Peppy Peep')
      fill_in('username', with: 'Peepqueen')
      click_button('SIGN UP')
    end

  scenario 'A user can see peeps' do
    Peep.create(message: 'hello')
    click_button('submit')
    expect(page).to have_content 'hello'
  end

end
