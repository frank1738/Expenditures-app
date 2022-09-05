require 'rails_helper'

RSpec.describe 'Expenditure', type: :feature do
  describe 'Expenditure' do
    before(:each) do
      @user = User.create! password: '123456', email: 'user@email.com', name: 'User Name'
      @category = Category.create! name: 'group', author_id: @user.id, icon: 'Education'
      Payment.create! name: 'Expenditure', author_id: @user.id, amount: 20
      Payment.create! name: 'new Expenditure', author_id: @user.id, amount: 50

      visit '/users/sign_in'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password(6 characters)', with: '123456'
      click_button 'Log in'
    end

    scenario 'I can see an expenditure I added' do
      click_link 'group'
      expect(page).to have_content('ADD NEW TRANSACTION')
    end
  end
end
