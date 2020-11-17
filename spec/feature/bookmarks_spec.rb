feature 'bookmarks list' do
  scenario 'it lists bookmarks' do
    visit '/'
    click_link "Bookmarks"
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
  end
end
