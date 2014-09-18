require 'spec_helper'

feature 'User views a class subscribers' do
  scenario 'views all the subscribers' do
    user = create(:user, :with_groups)
    subscribers = create_list(:subscriber, 2)
    subscribers.each do |subscriber|
      create(:subscription, group: user.groups.first, subscriber: subscriber)
    end
    login_as(user, scope: :user)

    visit '/'

    expect(page).to have_content('2 inscrits')
    within('#subscribers') do
      subscribers.each do |subscriber|
        expect(page).to have_link(subscriber.name)
      end
    end
  end

  scenario 'views a blankslate' do
    user = create(:user, :with_groups)
    login_as(user, scope: :user)

    visit '/'

    expect(page).to have_content('0 inscrits')
    expect(page).to have_content("Aucun parent n'est inscrit à cette classe.")
  end
end
