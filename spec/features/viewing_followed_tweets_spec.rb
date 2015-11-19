require 'rails_helper'

feature 'messages by folowed users' do

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
      visit tweets_path
      click_link('Following')
      expect(page).not_to have_content('test tweet by user_1')
      expect(page).to have_content('No tweets yet!')
    end
  end

  context 'signed in with followed users' do
    before do
      poster = create(:user)
      follower = create(:user)
      poster.tweets.create(tweet_content: 'a tweet by mr poster')
      visit tweets_path
      sign_in(follower)
      follower.follow(poster)
    end

    scenario 'the follower can see the posters post' do
      click_link 'Following'
      expect(page).to have_content('a tweet by mr poster')
    end
  end
end
