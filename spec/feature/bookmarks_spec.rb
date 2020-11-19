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

  scenario 'can delete stuff as well' do
    add_stuff_to_database
    visit '/'
    click_link "Bookmarks"
    fill_in "add_bookmark", with: "http://oop"
    fill_in "Title", with: "Oop"
    click_button "add"
    fill_in "add_bookmark", with: "http://google.com"
    fill_in "Title", with: "Google"
    click_button "add"
    fill_in 'delete_bookmark', with: 'Oop'
    click_button 'Yeet'
    expect(page).not_to have_content "Oop"
    expect(page).to have_content "Google"
  end

  scenario 'can edit your bookmarks' do
    add_stuff_to_database
    visit '/'
    click_link "Bookmarks"
    first('.bookmark').click_button('Edit')
    fill_in "url", with: "www.pornhub.com"
    fill_in "title", with: "chub hub"
    click_button 'Confirm'
    expect(page).to have_content "chub hub"
    expect(page).not_to have_content "Makers Academy"
  end
end
