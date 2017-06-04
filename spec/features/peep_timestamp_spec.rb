# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Peeps have timestamps' do
  scenario 'see when peeps was created' do
    enter_peep
    expect(page).to have_content "#{Time.now.strftime('%c')}"
  end
end
