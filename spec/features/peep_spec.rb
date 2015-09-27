require 'spec_helper'

feature 'User can create peeps' do

  scenario 'I can create a new peep' do
    user = create :user
    sign_in(user)
    time = Time.new
    creation_time = "Peeped on #{time.day}-#{time.month}-#{time.year}"
    visit '/peeps/new'
    fill_in :content, with: "Hello world!"
    expect {click_button("Post new peep")}.to change(Peep, :count).by(1)
    expect(current_path).to eq('/peeps')
    expect(page).to have_content("Hello world!")
    expect(page).to have_content('Joe Zhou')
    expect(page).to have_content('joema')
    expect(page).to have_content(creation_time)
  end

  scenario 'I can create more peeps after the first one' do
    user = create :user
    sign_in(user)
    time = Time.new
    creation_time = "Peeped on #{time.day}-#{time.month}-#{time.year}"
    visit '/peeps/new'
    fill_in :content, with: "Hello world!"
    expect {click_button("Post new peep")}.to change(Peep, :count).by(1)
    expect(current_path).to eq('/peeps')
    expect(page).to have_content("Hello world!")
    expect(page).to have_content('Joe Zhou')
    expect(page).to have_content('joema')
    expect(page).to have_content(creation_time)
    visit '/peeps/new'
    fill_in :content, with: "Peeeep Number 2!"
    expect {click_button("Post new peep")}.to change(Peep, :count).by(1)
    expect(page).to have_content("Peeeep Number 2!")
    visit '/peeps/new'
    fill_in :content, with: "Peeeep Number 3!"
    expect {click_button("Post new peep")}.to change(Peep, :count).by(1)
    expect(page).to have_content("Peeeep Number 3!")
  end

end
