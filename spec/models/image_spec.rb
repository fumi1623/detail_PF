require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'アソシエーションのテスト' do
    context 'eventモデルとの関係' do
      it 'N:1となっている' do
        expect(Image.reflect_on_association(:event).macro).to eq :belongs_to
      end
    end
  end
end
