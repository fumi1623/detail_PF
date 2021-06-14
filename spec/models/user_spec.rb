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
        user.name = "あ"
        is_expected.to eq false
      end
      it '２文字では○' do
        user.name = "ああ"
        is_expected.to eq true
      end
    end

  end
end
