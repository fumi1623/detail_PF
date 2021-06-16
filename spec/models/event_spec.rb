require 'rails_helper'

RSpec.describe Event, type: :model do

  describe 'バリデーションテスト' do
    subject { event.valid? }
    let(:user) { create(:user) }
    let!(:event) { build(:event, user_id: user.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        event.name = ''
        is_expected.to eq false
      end
      it '20文字では○' do
        event.name = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
      it '21文字ではでは×' do
        event.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end
    context 'placeカラム' do
      it '空欄では○' do
        event.place = nil
        is_expected.to eq true
      end
      it '20文字では○' do
        event.place = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
      it '21文字ではでは×' do
        event.place = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end
    context 'start_timeカラム' do
      it '空でないこと' do
        event.start_time = nil
        is_expected.to eq false
      end
      it '開始が終了より早いこと' do
        event.start_time = DateTime.current
        event.end_time = DateTime.current + 1
        is_expected.to eq true
      end
    end
    context 'end_timeカラム' do
      it '空でないこと' do
        event.end_time = nil
        is_expected.to eq false
      end
      it '終了が開始より早くならないこと' do
        event.start_time = DateTime.current + 1
        event.end_time = DateTime.current
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Event.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'mapモデルとの関係' do
      it '1:Nとなっている' do
        expect(Event.reflect_on_association(:maps).macro).to eq :has_many
      end
    end
    context 'imageモデルとの関係' do
      it '1:Nとなっている' do
        expect(Event.reflect_on_association(:images).macro).to eq :has_many
      end
    end
    context 'tag_relationshipモデルとの関係' do
      it '1:Nとなっている' do
        expect(Event.reflect_on_association(:tag_relationships).macro).to eq :has_many
      end
    end
    context 'tagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Event.reflect_on_association(:tags).macro).to eq :has_many
      end
    end
  end

end