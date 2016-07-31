feature 'viewing peeps' do

  before :each do
    sign_up
    post_peep(content: 'This is a peep')
    post_peep(content: 'This is another peep')
  end

  scenario "user can see peep feed without signing in" do
    click_button 'Sign out'
    visit ('/peeps')
    expect(page.status_code).to eq 200
    expect(page).to have_content('This is a peep')
    expect(page).to have_content('This is another peep')
  end

  scenario 'displays date and time posted' do
    expect(current_path).to eq '/peeps'
    expect(page).to have_content Time.new.strftime("%e %B %k:%M")
  end
end
