require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  describe 'Categories' do
    before(:each) do
      @user = User.create! password: '123456', email: 'user@email.com', name: 'User Name'
      Category.create! name: 'group', author_id: @user.id, icon: 'Education'

      visit '/users/sign_in'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password(6 characters)', with: '123456'
      click_button 'Log in'
    end

    scenario 'I see add a category button' do
      expect(page).to have_content('Add New Category')
    end

    scenario 'I can see a category I added' do
      expect(page).to have_content('Category')
    end

    scenario 'A NEW CATEGORY page' do
      click_link 'Add New Category'
      expect(page).to have_content('Select label for an icon')
    end
  end
end
