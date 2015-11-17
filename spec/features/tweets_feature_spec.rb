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
      visit tweets_path
      @user = create(:user)
      sign_in(@user)
    end

    scenario 'a tweet can be created' do
      visit tweets_path
      fill_in "tweet[tweet_content]", with: 'test tweet'
      click_button 'Post message'
      expect(page).to have_content "#{@user.email}: test tweet"
    end
  end
end
