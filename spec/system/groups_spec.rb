require 'rails_helper'

RSpec.describe Group, type: :system do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:group) { create(:group) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'グループ登録のテスト' do
    before do
      visit groups_path
    end
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/groups'
      end
      it '新規グループフォームが表示される' do
        expect(page).to have_field 'group[name]'
        expect(page).to have_button '作成'
      end
    end
    context 'グループの新規登録確認' do
      before do
        fill_in 'group[name]', with: Faker::Lorem.characters(number: 5)
      end
      it '新規登録ができる' do
        click_button '作成'
        expect(current_path).to eq '/groups'
        # expect { click_button '作成' }.to change(Group.all, :count).by(1)
      end
    end
  end


end