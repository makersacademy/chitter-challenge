feature 'Viewing peeps' do 

  before do
    current_user = User.create( name: 'Lexi', username: 'lexiht', 
                                email: 'hello@example.com',
                                password: 'hello', 
                                password_confirmation: 'hello')
    
    current_user.peeps.create(message: 'Sinatra is awesome.')
    sleep 0.2
    current_user.peeps.create(message: 'Hello world!')
  end

  scenario 'I can see peeps' do
    visit '/peeps'
    expect(page).to have_content(/.*"Hello world!".*"Sinatra is awesome./)
  end

  scenario 'I can see when the peep was posted' do
    visit '/peeps'
    formatted = Time.now.strftime("%H:%M  %d-%b-%Y")

    expect(page).to have_content(formatted)
  end
end