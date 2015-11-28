feature 'users profile pages' do

  context "logged in" do
    before do
      @user_1 = create(:user)
      @user_2 = create(:user)
      visit tweets_path
      sign_in(@user_1)
      fill_in "tweet[tweet_content]", with: 'test tweet by user_1'
      click_button 'Post message'
      fill_in "tweet[tweet_content]", with: 'second test tweet by user_1'
      click_button 'Post message'
      click_link 'Sign out'
      sign_in(@user_2)
      fill_in "tweet[tweet_content]", with: 'test tweet by user_2'
      click_button 'Post message'
      visit tweets_path
    end

    scenario "all tweets by a user can be viewed at their profile page" do
      first(:link, "#{@user_1.username}").click
      expect(page).to have_content "test tweet by user_1"
      expect(page).to have_content "second test tweet by user_1"
      expect(page).not_to have_content "test tweet by user_2"
    end

    scenario "all tweets by current user can be viewed at their profile" do
      within ".account" do
        click_link "#{@user_2.username}"
      end
      expect(page).to have_content "test tweet by user_2"
      expect(page).not_to have_content "test tweet by user_1"
    end
  end

end
