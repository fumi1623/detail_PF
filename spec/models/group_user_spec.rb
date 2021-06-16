require 'rails_helper'

RSpec.describe GroupUser, type: :model do

  describe 'バリデーションテスト' do
    subject { group_user.valid? }
    let(:user) { create(:user) }
    let(:group) { create(:group) }
    let(:group_user) { build(:group_user, user_id: user.id, group_id: group.id) }

    context 'user_idカラム' do
      it '空欄でないこと' do
        group_user.user_id = ''
        is_expected.to eq false
      end
      it 'user.idでは○' do
        group_user.user_id = user.id
        is_expected.to eq true
      end
    end
    context 'group_idカラム' do
      it '空欄でないこと' do
        group_user.group_id = ''
        is_expected.to eq false
      end
      it 'group.idでは○' do
        group_user.group_id = group.id
        is_expected.to eq true
      end
    end
    context 'userとgroupの組み合わせ' do
      let!(:other_group_user) { create(:group_user, user_id: user.id, group_id: group.id) }
      it '一意性があること' do
        other_group_user.group_id = group_user.group_id
        other_group_user.user_id = group_user.user_id
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'groupモデルとの関係' do
      it 'N:1となっている' do
        expect(GroupUser.reflect_on_association(:group).macro).to eq :belongs_to
      end
    end
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(GroupUser.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end

end