feature 'Viewing peeps' do 

  before do
    current_user = User.create( name: 'Lexi', username: 'lexiht', 
                                email: 'hello@example.com',
                                password: 'hello', 
                                password_confirmation: 'hello')
    
    current_user.peeps.create(message: 'Sinatra is awesome.')
    current_user.peeps.create(message: 'Hello world!')
  end

  scenario 'I can see peeps' do
    visit '/peeps'
    expect(page).to have_content "Sinatra is awesome."
  end
  
end