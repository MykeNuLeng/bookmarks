feature 'bookmarks list' do
  scenario 'it lists bookmarks' do
    add_stuff_to_database
    visit '/'
    click_link "Bookmarks"
    expect(page).to have_content "Makers Academy"
    expect(page).to have_content "Google"
    expect(page).to have_content "Destroy All Software"
  end

  scenario 'it adds stuff' do
    add_stuff_to_database
    visit '/'
    click_link "Bookmarks"
    fill_in "add_bookmark", with: "http://oop"
    fill_in "Title", with: "Oop"
    click_button "add"
    expect(page).to have_content "Oop"
  end
end
