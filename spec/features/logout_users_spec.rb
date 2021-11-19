require 'pg'

feature 'logging out a user' do
  scenario 'a signed in user can log out' do
    User.create(name: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')

    visit('/')
    click_button('Log in')
    visit('/users/login')
    fill_in :email, with: 'hagrid@gmail.com'
    fill_in :password, with: 'hagrid123'
    click_button('Sign in')
    visit('/properties')
    click_button('Sign out')
    visit('/')
    expect(page).to have_content('Welcome to Makers BnB!')

  end
end
