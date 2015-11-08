# As a maker
# So that I can better appreciate the context of a peep
# I want to see how long ago message was peeped 

feature 'See how long ago message was peeped' do
  before do
    creation = DateTime.now - 1 
    sign_up
    log_in
    user = User.first
    user.peeps << Peep.create(message: 'Some tweet', created_at: creation)
    user.save
  end

  scenario 'A message posted 1 day ago' do 
    visit '/feeds/view'
    within('div .feeds') do
      expect(page).to have_content('1 day ago')
    end
  end 

end
