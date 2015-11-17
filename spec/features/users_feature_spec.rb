require 'rails_helper'

feature 'users management' do

  context 'user not signed in' do

    before(:each) do
      visit tweets_path
    end

    scenario 'shows a sign in and sign up link' do
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    scenario 'does not show a sign out link' do
      expect(page).not_to have_link('Sign out')
    end

    scenario 'does not show a tweet creation button' do
      expect(page).not_to have_button('Post message')
    end

  end

  context 'user signed in' do

    before do
      user = create(:user)
      visit tweets_path
      sign_in(user)
    end

    scenario 'shows a sign out link' do
      expect(page).to have_link 'Sign out'
    end

    scenario 'does not show sign in and sign up links' do
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

    scenario 'shows a tweet creation button' do
      expect(page).to have_button('Post message')
    end

  end
  
end
