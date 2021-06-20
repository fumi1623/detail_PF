require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'バリデーションテスト' do
    subject { group.valid? }
    let(:group) { build(:group) }

    context 'nameカラム' do
      it '空欄でないこと' do
        group.name = ''
        is_expected.to eq false
      end
      it '20文字では○' do
        group.name = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
      it '21文字ではでは×' do
        group.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'userモデルとの関係' do
      it '1:Nとなっている' do
        expect(Group.reflect_on_association(:users).macro).to eq :has_many
      end
    end
    context 'group_userモデルとの関係' do
      it '1:Nとなっている' do
        expect(Group.reflect_on_association(:group_users).macro).to eq :has_many
      end
    end
  end
end
