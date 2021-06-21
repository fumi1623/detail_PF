require 'rails_helper'

RSpec.describe Group, type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:third_user) { create(:user) }
  let!(:group) { create(:group) }
  let!(:group_user) { create(:group_user, user: user, group: group, invitation: true) }
  let!(:other_group_user) { create(:group_user, user: other_user, group: group, invitation: true) }
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
      it '新規登録ができる' do
        fill_in 'group[name]', with: Faker::Lorem.characters(number: 5)
        expect { click_button '作成' }.to change(Group.all, :count).by(1)
        expect(page).to have_content 'グループが登録されました'
      end
      it 'グループ名が空欄の場合、エラーメッセージが出る' do
        fill_in 'group[name]', with: ''
        expect { click_button '作成' }.to change(Group.all, :count).by(0)
        expect(page).to have_content 'グループ名を入力してください'
      end
    end
  end

  describe 'グループ詳細のテスト' do
    let!(:event) { create(:event, user: user, release: true) }
    let!(:other_event) { create(:event, user: user, release: false) }
    before do
      visit group_path(group)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/groups/' + group.id.to_s
      end
      it 'グループ名が表示される' do
        expect(page).to have_content group.name
      end
      it 'グループ編集リンクが表示される' do
        expect(page).to have_link '', href: edit_group_path(group)
      end
      it '予定追加リンクが表示される' do
        expect(page).to have_link '予定を追加　＞', href: new_event_path
      end
      it 'グループに所属しているユーザーの名前が表示される' do
        expect(page).to have_content user.name
        expect(page).to have_content other_user.name
      end
      it '公開設定の予定が表示される' do
        expect(page).to have_content event.name
      end
      it '非公開設定の予定が表示されない' do
        expect(page).not_to have_content other_event.name
      end
    end
  end

  describe 'グループ編集のテスト' do
    before do
      visit edit_group_path(group)
    end
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/groups/' + group.id.to_s + '/edit'
      end
      it 'グループ名が表示される' do
        expect(page).to have_content group.name
      end
      it 'グループ名フォームが表示される' do
        expect(page).to have_field 'group[name]'
      end
      it 'グループ名変更ボタンが表示される' do
        expect(page).to have_button 'グループ名変更'
      end
      it 'グループに所属しているユーザーの名前が表示される' do
        expect(page).to have_content user.name
        expect(page).to have_content other_user.name
      end
      it '各メンバーの削除リンクが表示される' do
        expect(page).to have_link 'メンバーから外す',
                                  href: group_user_path(group_user: { user_id: user.id }, id: group.id)
        expect(page).to have_link 'メンバーから外す',
                                  href: group_user_path(group_user: { user_id: other_user.id }, id: group.id)
      end
      it 'ユーザーを追加するフォームが表示される' do
        expect(page).to have_field 'group_user[user_id]'
      end
      it '招待を送るボタンが表示される' do
        expect(page).to have_button '招待を送る'
      end
    end
    context 'グループ編集成功のテスト' do
      it 'nameの変更ができる' do
        @old_group_name = group.name
        fill_in 'group[name]', with: Faker::Lorem.characters(number: 4)
        click_button 'グループ名変更'
        expect(group.reload.name).not_to eq @old_group_name
      end
      it 'メンバーの追加ができる' do
        fill_in 'group_user[user_id]', with: third_user.id
        expect { click_button '招待を送る' }.to change(GroupUser.all, :count).by(1)
        expect(current_path).to eq '/groups/' + group.id.to_s
        expect(page).to have_content '招待を送りました'
      end
    end
    context 'グループ編集失敗のテスト' do
      it 'name空欄はエラー' do
        fill_in 'group[name]', with: ''
        click_button 'グループ名変更'
        expect(page).to have_content 'グループ名を入力してください'
      end
      it 'ユーザーID空欄はエラー' do
        fill_in 'group_user[user_id]', with: ''
        click_button '招待を送る'
        expect(page).to have_content '有効なユーザーを入力してください'
      end
      it '存在しないユーザーIDはエラー' do
        fill_in 'group_user[user_id]', with: '4'
        click_button '招待を送る'
        expect(page).to have_content '有効なユーザーを入力してください'
      end
    end
  end
end
