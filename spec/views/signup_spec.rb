require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'login' do
    before(:each) do
      visit '/users/sign_up'
    end

    scenario ' I can sign up all user details' do
      fill_in 'Full name', with: 'User'
      fill_in 'Email', with: 'user@gmail.com'
      fill_in 'Password(6 characters)', with: '123456'
      fill_in 'Confirm your password', with: '123456'
      click_button 'Sign up'

      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario ' I can not sign up without user name user details' do
      fill_in 'Full name', with: ''
      fill_in 'Email', with: 'user@gmail.com'
      fill_in 'Password(6 characters)', with: '123456'
      fill_in 'Confirm your password', with: '123456'
      click_button 'Sign up'

      expect(page).to have_content("Name can't be blank")
    end
  end
end