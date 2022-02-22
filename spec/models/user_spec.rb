require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:habits) }
  end

  describe '#author_of?' do
    let(:user) { create(:user) }
    let(:habit) { create(:habit, author: user) }

    context 'when return true' do
      it 'user is author of habit' do
        expect(user).to be_author_of(habit)
      end
    end
  end
end
