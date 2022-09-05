require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'login' do
    before(:each) do
      User.create! password: '123456', email: 'user@email.com', name: 'User Name'
      visit '/users/sign_in'
    end

    scenario ' I can log in with correct user details' do
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password(6 characters)', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end

    scenario ' I cannot log in with incorrect user details' do
      fill_in 'Email', with: 'usr@email.cm'
      fill_in 'Password(6 characters)', with: '123456'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password'
    end
  end
end