require 'rails_helper'

RSpec.describe Achievement, type: :model do
  describe 'validations' do
    it 'requires title' do
      achievement = Achievement.new(title: '')
      expect(achievement.valid?).to be_falsy
      # other ways
      #achievement.valid?
      #expect(achievement.errors[:title]).to include("can't be blank")
      #expect(achievement.errors[:title]).not_to be_empty
    end

    it 'requires title to be unique for one user' do
      user = create(:user)
      first_achievement = create(:public_achievement, title: 'First Achievement', user: user)
      new_achievement = Achievement.new(title: 'First Achievement', user: user)
      expect(new_achievement.valid?).to be_falsy
    end

    it 'allows different users to have achievements with identical titles' do
      user1 = create(:user)
      user2 = create(:user)
      first_achievement = create(:public_achievement, title: 'First Achievement', user: user1)
      new_achievement = Achievement.new(title: 'First Achievement', user: user2)
      expect(new_achievement.valid?).to be_truthy
    end
  end
end
