feature 'Making a peep' do
  before(:each) do
    @user = User.register(name: 'Faceless Old Woman', \
      user_name: 'FacelessOW', email: 'mystery@domain.com', \
      password: '123456789')
  end
  scenario 'sending a peep' do
    sign_in
    fill_in 'peep_content', with: 'Hi, everybody!'
    click_button 'Make A Peep'
    expect(page).to have_content 'Hi, everybody!'
  end
end

feature 'A user can see peeps on the peeps/index' do
  before(:each) do
    @user = User.register(name: 'Faceless Old Woman', \
      user_name: 'FacelessOW', email: 'mystery@domain.com', \
      password: '123456789')
  end
  scenario 'Peeps will appear in reverse chronological order' do
    sign_in
    fill_in 'peep_content', with: 'Is anyone there?'
    click_button 'Make A Peep'
    fill_in 'peep_content', with: 'Hi, everyone'
    click_button 'Make A Peep'

    expect(page.body) =~ /Hi, everyone.*Is anyone there?/
  end
end
