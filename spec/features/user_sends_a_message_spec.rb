require 'rails_helper'

feature 'User sends a message' do
  scenario 'sees the message in sent list' do
    user = create(:user, :with_groups)
    login_as(user, scope: :user)

    visit '/'
    within('#new-message') do
      fill_in 'message_body', with: 'Hello guys!'
      click_button 'Envoyer'
    end

    within('#sent-messages') do
      expect(page).to have_content('Hello guys!')
    end
  end
end
