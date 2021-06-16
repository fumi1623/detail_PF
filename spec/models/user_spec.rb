require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'バリデーションテスト' do
    subject { user.valid? }
    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }

    context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ""
        is_expected.to eq false
      end
      it '1文字では×' do
        user.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '2文字では○' do
        user.name = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '15文字では○' do
        user.name = Faker::Lorem.characters(number: 15)
        is_expected.to eq true
      end
      it '16文字ではでは×' do
        user.name = Faker::Lorem.characters(number: 16)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'eventモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:events).macro).to eq :has_many
      end
    end
    context 'group_userモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:group_users).macro).to eq :has_many
      end
    end
    context 'groupモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:groups).macro).to eq :has_many
      end
    end
  end
end
