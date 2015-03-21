require 'rails_helper'

feature 'User deletes a subscription' do
  scenario 'deletes a group subscription' do
    user = create(:user, :with_groups)
    subscribers = create_list(:subscriber, 2)
    subscribers.each do |subscriber|
      create(:subscription, group: user.groups.first, subscriber: subscriber)
    end
    login_as(user, scope: :user)

    visit '/'
    first('li.subscription').click_link 'Supprimer de cette liste'

    expect(page).to have_content('1 inscrit')
  end
end
