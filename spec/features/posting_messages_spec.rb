feature do "posting messages" 
  scenario do "check if homepage has status bar"
    visit('/')
    expect(page).to have_content('Enter status here:')
  end

  scenario do "typed message gets types"
    visit('/')
    fill_in "status", with: "I am feeling chittery today!"
    click_button("Post status")
    expect(page).to have_content("I am feeling chittery today!")
end

end