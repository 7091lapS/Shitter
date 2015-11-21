require 'rails_helper'

feature 'following and unfollowing users' do

  context 'user signed in' do
    before do
      user_1 = create(:user)
      @user_2 = create(:user)
      visit tweets_path
      sign_in(user_1)
      fill_in "tweet[tweet_content]", with: 'test tweet by user_1'
      click_button 'Post message'
      click_link 'Sign out'
      sign_in(@user_2)
      visit tweets_path
    end

    scenario 'cannot see posts by unfollowed users' do
      click_link('Following Stream')
      expect(page).not_to have_content 'test tweet by user_1'
      expect(page).to have_content 'No tweets yet!'
    end

    # scenario 'can see a link to follow another user' do
    #   within('ul') do
    #     expect(page).to have_link 'Follow'
    #   end
    # end

    scenario 'after following, should see the tweet in the Following stream' do
      click_link "#{@user_2.email}"
      click_link 'Follow'
      click_link 'Following Stream'
      expect(page).to have_content 'test tweet by user_1'
    end

    scenario 'after following, should see Unfollow link' do
      click_link "#{@user_2.email}"
      click_link 'Follow'
      expect(page).to have_link 'Unfollow'
      click_link 'Unfollow'
      expect(page).to have_link 'Follow'
    end

    scenario 'after unfollowing, should not see the post in the Following stream' do
      click_link "#{@user_2.email}"
      click_link 'Follow'
      click_link 'Unfollow'
      click_link 'Following Stream'
      expect(page).not_to have_content 'test tweet by user_1'
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
      expect(page).to have_content 'a tweet by mr poster'
    end
  end

  context 'visting as signed out guest' do

    scenario 'a guest cannot see stream section links' do
      visit tweets_path
      expect(page).not_to have_link 'All tweets'
      expect(page).not_to have_link 'Following'
    end

    scenario 'a guest cannot see follow/unfollow links' do
      visit tweets_path
      expect(page).not_to have_link 'Follow'
      expect(page).not_to have_link 'Unfollow'
    end
  end
end
