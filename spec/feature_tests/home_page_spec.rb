feature 'Can add a post' do
  it 'Adds a post to the chitter feed' do
    visit '/'
    find('#login').click
    fill_in :username, with: 'andrew'
    fill_in :password, with: 'pwd12'
    click_button "Submit"
    expect(page).to have_field :new_peep
    peep = "Hey everyone, just smashing out some code."
    fill_in :new_peep, with: peep
    find('#submit_peep').click
    expect(page).to have_css(".feed", :text => peep)
  end

  it 'Adds the time the peep was made to the peep' do
    visit '/'
    expect(page).to have_css(".feed", :text => Time.new.year)
  end
end

feature 'Users' do
  it 'Registers new users' do
    visit '/'
    find('#register_user').click
    fill_in :username, with: 'andrew2'
    fill_in :name, with: 'A Wood'
    fill_in :email, with: 'test@hotmail.co.uk'
    fill_in :password, with: 'pwd12'
    fill_in :pass2, with: 'pwd12'
    click_button "Submit"
    expect(page).to have_content 'andrew2'
    expect(page).to have_content 'A Wood'
    expect(page).to have_content 'test@hotmail.co.uk'
    click_button "Home page"
    expect(page).to have_content 'andrew2'
  end

  it 'Logs-in users' do
    visit '/'
    find('#login').click
    fill_in :username, with: 'andrew'
    fill_in :password, with: 'pwd12'
    click_button "Submit"
    expect(page).to have_content 'andrew'
    expect(page).not_to have_content 'BACKTRACE'
  end

end
