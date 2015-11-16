require 'rails_helper'

feature 'tweets' do

  context 'no tweets have been added' do
    scenario 'a no-tweets warning is displayed' do
      visit tweets_path
      expect(page).to have_content 'No tweets yet!'
    end
  end  
end
