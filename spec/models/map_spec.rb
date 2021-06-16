require 'rails_helper'

RSpec.describe Map, type: :model do

  describe 'バリデーションテスト' do
    subject { map.valid? }
    let(:user) { create(:user) }
    let(:event) { create(:event, user_id: user.id) }
    let!(:map) { build(:map, event_id: event.id) }

    context 'nameカラム' do

      it '空欄でないこと' do
        map.name = ''
        is_expected.to eq false
      end
      it '1文字では○' do
        map.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq true
      end
      it '10文字では○' do
        map.name = Faker::Lorem.characters(number: 10)
        is_expected.to eq true
      end
      it '11文字ではでは×' do
        map.name = Faker::Lorem.characters(number: 11)
        is_expected.to eq false
      end

    end

  end

end