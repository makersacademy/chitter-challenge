feature 'Viewing peeps' do

  scenario 'I can see all peeps on chitter on the peeps page' do
    sign_up
    sign_in(email: 'daniel.costea@vkernel.ro', password: '123456')
    Peeps.create(peep: 'Hey!!')

    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Hey!!')

  end
end

feature 'Writing peeps' do

  before do
    sign_up
    sign_in(email: 'daniel.costea@vkernel.ro', password: '123456')
    visit '/peeps/new'
    fill_in 'peep',   with: 'I am peeping!'
    click_button 'Peep!'
  end

  scenario 'I can create a new peep' do
    expect(current_path).to eq '/'
    expect(page).to have_content('I am peeping!')
  end

  scenario 'There is a time stamp for when I created a peep' do
    expect(current_path).to eq '/'
    expect(page).to have_content Time.now
  end
end
