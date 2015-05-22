feature 'User can see the peeps that were posted' do

  before(:each) do
    sign_up
    Peep.create(content: 'Hello Makers! This is a peep test!', 
                user_id: User.first.id)
  end

  scenario 'when opening the home page' do
    visit '/'
    expect(page).to have_content('Hello Makers')
  end
end