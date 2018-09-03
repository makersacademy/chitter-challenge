require_relative '../web_helper'

feature 'Can add a post' do
  it 'Adds a post to the chitter feed' do
    log_in
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
    register_new
    expect(page).to have_content 'andrew2'
    expect(page).to have_content 'A Wood'
    expect(page).to have_content 'test@hotmail.co.uk'
    click_button "Home page"
    expect(page).to have_content 'andrew2'
  end

  it 'Can register, log out and log in' do
    register_new
    click_button "Home page"
    click_button "Log out"
    click_button "Log in"
    fill_in :username, with: 'andrew2'
    fill_in :password, with: 'pwd12'
    click_button "Submit"
    expect(page).to have_content 'andrew2'
    expect(page).not_to have_content 'BACKTRACE'
  end

  it 'Logs-in users' do
    log_in
    expect(page).to have_content 'andrew'
    expect(page).not_to have_content 'BACKTRACE'
  end

  # feature 'Peep comments' do
  #   it 'allows me to comment on peeps' do
  #     log_in
  #     first('.pcomment').fill_in :new_comment, with: "Totally agree"
  #     first('.pcomment').click_button "Submit"
  #     expect(page).to have_content "Totally agree"
  #     expect(page).not_to have_content 'BACKTRACE'
  #   end
  # end
end
