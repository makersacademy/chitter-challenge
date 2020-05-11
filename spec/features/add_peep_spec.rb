feature 'peeps' do
  scenario 'user can add a peep' do
    visit('/peeps')
    fill_in('body', with: 'Today was a good day')
    @time = '2020-10-24 11:11:11'
    allow(Time).to receive(:now).and_return(@time)
    click_button('post')
    expect(page).to have_content('2020-10-24 11:11:11')
    expect(page).to have_content('Today was a good day')
  end
end