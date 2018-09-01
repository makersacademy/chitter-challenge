feature 'homepage' do

  scenario 'user can input their name' do
    visit '/'
    fill_in 'name', with: 'Freddie'
    click_on 'submit'
  end
end