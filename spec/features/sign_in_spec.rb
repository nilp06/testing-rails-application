require 'rails_helper'

RSpec.feature 'SignIns', type: :feature do
  let(:user) { create :user }

  scenario 'with valid input' do
    visit new_user_session_url
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
    expect(page).to have_content 'This is Home page.'
  end
end
