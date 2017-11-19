feature 'See all peeps' do
  before(:each) do
    sign_up
    fill_in('peep', with: 'Hello world!')
    click_button('Post!')
  end

  scenario 'see a list of peeps' do
    expect(page).to have_content 'Hello world!'
  end

  # scenario 'the peeps include the time when written' do
  #   allow(Time).to receive(:now).and_return('Wed Apr 9 08:56:03 2003')
  #   expect(page).to have_content 'Hello world! Wed Apr 9 08:56:03 2003'
  # end
end
