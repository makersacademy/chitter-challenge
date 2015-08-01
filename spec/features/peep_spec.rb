feature 'Viewing peeps' do

  before(:each) do
    user = create :user
    sign_in_as(user)
  end

  scenario 'user can see existing peeps on the main page' do
    Peep.create(message: 'Hello, this is my first peep!!')
    visit '/peeps'
    expect(page).to have_content('Hello, this is my first peep!!')
  end

  scenario 'user can write a peep' do
    visit '/peeps'
    fill_in 'peep', with: 'This app is awesome!!'
    click_button 'Peep'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('This app is awesome!!')
  end


end