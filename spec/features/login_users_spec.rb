require 'pg'

feature 'authentication' do
  scenario 'a registered user can log in' do
    User.create(name: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')

    # visit('/')
    # click_button('Log in')
    visit('/users/login')
    fill_in :email, with: 'hagrid@gmail.com'
    fill_in :password, with: 'hagrid123'
    click_button('Sign in')
    visit('/properties')
    expect(page).to have_content("Hello Hagrid")
  end
end