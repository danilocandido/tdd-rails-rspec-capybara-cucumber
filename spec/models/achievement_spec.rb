require 'rails_helper'

RSpec.describe Achievement, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title).scoped_to(:user_id).with_message("you can't have two achievements with the same title") }
    it { is_expected.to belong_to(:user) }
  end

  it 'conveerts markdown to html' do
    achievement = Achievement.new(description: 'Awesome **thing** I *actually* did')
    expect(achievement.description_html).to include('<strong>thing</strong>')
    expect(achievement.description_html).to include('<em>actually</em>')
  end

  it 'has silly title' do
    achievement = Achievement.new(title: "New Achievement", user: create(:user, email: 'email@mail.com'))
    expect(achievement.silly_title).to eq 'New Achievement by email@mail.com'
  end

  it 'only fetches achievements which title stars from provided letter' do
    user = create(:user)
    achievement1 = create(:public_achievement, title: 'Read a book', user: user)
    achievement2 = create(:public_achievement, title: 'Passed an exam', user: user)
    expect(Achievement.by_letter('R')).to eq [achievement1]
  end

  it 'sorts achievements by user emails' do
    albert = create(:user, email: 'albert@mail.com')
    rob = create(:user, email: 'rob@mail.com')
    achievement1 = create(:public_achievement, title: 'Read a book', user: rob)
    achievement2 = create(:public_achievement, title: 'Rocked it', user: albert)
    expect(Achievement.by_letter('R')).to eq [achievement2, achievement1]
  end
end
