require 'rails_helper'

feature 'tweets' do

  context 'no tweets have been added' do
    scenario 'a no-tweets warning is displayed' do
      visit tweets_path
      expect(page).to have_content 'No tweets yet!'
    end
  end

  context 'creating tweets' do
    before do
      @user = create(:user)
      visit tweets_path
      sign_in(@user)
    end

    scenario 'a tweet can be created and is displayed' do
      visit tweets_path
      fill_in "tweet[tweet_content]", with: 'test tweet'
      click_button 'Post message'
      expect(page).to have_content "#{@user.email}: test tweet"
      click_link 'Sign out'
      expect(page).to have_content "#{@user.email}: test tweet"
    end
  end

  context 'signed in without any followed users' do
    before do
      user_1 = create(:user)
      @user_2 = create(:user)
      visit tweets_path
      sign_in(user_1)
    end

    scenario 'a user cannot see posts by unfollowed users' do
      fill_in "tweet[tweet_content]", with: 'test tweet by user_1'
      click_button 'Post message'
      click_link 'Sign out'
      sign_in(@user_2)
      expect(page).not_to have_content('test tweet by user_1')
    end
    
  end
end
