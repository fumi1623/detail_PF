require 'rails_helper'

RSpec.describe Tag, type: :model do

  describe 'バリデーションテスト' do
    subject { tag.valid? }
    let(:tag) { build(:tag) }

    context 'nameカラム' do
      it '空欄でないこと' do
        tag.name = ''
        is_expected.to eq false
      end
      it '10文字では○' do
        tag.name = Faker::Lorem.characters(number: 10)
        is_expected.to eq true
      end
      it '11文字ではでは×' do
        tag.name = Faker::Lorem.characters(number: 11)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'eventモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tag.reflect_on_association(:events).macro).to eq :has_many
      end
    end
    context 'tag_relationshipモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tag.reflect_on_association(:tag_relationships).macro).to eq :has_many
      end
    end
  end

end