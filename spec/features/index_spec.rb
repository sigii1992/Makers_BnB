feature 'Test' do
  scenario 'index page works' do
    visit('/')
    expect(page).to have_content 'Welcome to Makers BnB!'
  end
end
