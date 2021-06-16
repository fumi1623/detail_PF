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
    context 'addressカラム' do
      it '空欄でないこと' do
        map.address = ''
        is_expected.to eq false
      end
    end
    context 'latitudeカラム' do
      it '空でないこと' do
        map.address = nil
        map.latitude = nil
        is_expected.to eq false
      end
    end
    context 'longitudeカラム' do
      it '空でないこと' do
        map.address = nil
        map.longitude = nil
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'eventモデルとの関係' do
      it 'N:1となっている' do
        expect(Map.reflect_on_association(:event).macro).to eq :belongs_to
      end
    end
  end

end