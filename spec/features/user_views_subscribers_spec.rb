require 'rails_helper'

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

    within('#subscribers') do
      expect(page).to have_content('0 inscrits')
      expect(page).to have_content("Aucun parent n'est inscrit à cette classe.")
    end
  end

  scenario 'views formatted phone numbers' do
    user = create(:user, :with_groups)
    subscriber = create(:subscriber, phone: '0642755592')
    create(:subscription, group: user.groups.first, subscriber: subscriber)
    login_as(user, scope: :user)

    visit '/'

    within('#subscribers') do
      expect(page).to have_content('06 42 75 55 92')
    end
  end
end
