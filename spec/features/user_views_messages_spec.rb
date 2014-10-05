require 'rails_helper'

feature 'User views a group messages' do
  scenario 'views all the messages' do
    user = create(:user, :with_groups)
    login_as(user, scope: :user)
    message = create(:message, group: user.groups.first)

    visit '/'

    within('#sent-messages') do
      expect(page).to have_content(message.body)
    end
  end

  scenario 'views a blankslate' do
    user = create(:user, :with_groups)
    login_as(user, scope: :user)

    visit '/'

    within('#sent-messages') do
      expect(page).to have_content("Aucun message n'a encore été envoyé aux parents d'élèves de cette classe.")
    end
  end

  scenario 'views the created_at date and time' do
    user = create(:user, :with_groups)
    login_as(user, scope: :user)
    message = create(:message, group: user.groups.first, created_at: 2.hours.ago)

    visit '/'

    within('#sent-messages') do
      expect(page).to have_content(l(message.created_at, format: :short))
    end
  end
end
