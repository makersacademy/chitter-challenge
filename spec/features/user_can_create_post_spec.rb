feature '/' do 

  scenario 'create peep' do
    visit "/peeps/create"

    fill_in "peep[body]", with: "This is a test peep"

    click_on "Post"

    new_peep = Peep.last

    expect(new_peep.body).to eq "This is a test peep"

    expect(current_path).to eq "/peeps/#{new_peep.id}"
    expect(page).to have_content "This is a test peep"
    expect(page).to have_link "Take me home", href: "/"
  end

end
