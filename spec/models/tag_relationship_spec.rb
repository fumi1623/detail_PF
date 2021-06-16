require 'rails_helper'

RSpec.describe TagRelationship, type: :model do

  describe 'アソシエーションのテスト' do
    context 'eventモデルとの関係' do
      it 'N:1となっている' do
        expect(TagRelationship.reflect_on_association(:event).macro).to eq :belongs_to
      end
    end
    context 'tagモデルとの関係' do
      it 'N:1となっている' do
        expect(TagRelationship.reflect_on_association(:tag).macro).to eq :belongs_to
      end
    end
  end

end