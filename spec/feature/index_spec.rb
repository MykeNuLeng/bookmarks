feature "home page" do
  scenario 'it says hello world' do
    visit '/'
    expect(page).to have_content 'Hello world!'
  end
end
