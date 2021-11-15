

feature 'Test' do
  scenario 'index page works' do
    visit('/')
    expect(page).to have_content 'Hello from the MakersBnB app!'
  end
end
