require 'rails_helper'

RSpec.describe Event, type: :system do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:event) { create(:event, user: user) }
  let!(:other_event) { create(:event, user: other_user) }
  let!(:map) { create(:map, event: event) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe '予定登録のテスト' do
    before do
      visit new_event_path
    end
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/events/new'
      end
      it 'タイトルフォームが表示される' do
        expect(page).to have_field 'event[name]'
      end
      it '場所フォームが表示される' do
        expect(page).to have_field 'event[place]'
      end
      it '開始時間フォームが表示される' do
        expect(page).to have_field 'event[start_time]'
      end
      it '終了時間フォームが表示される' do
        expect(page).to have_field 'event[end_time]'
      end
      it '詳細フォームが表示される' do
        expect(page).to have_field 'event[detail]'
      end
      it '備考フォームが表示される' do
        expect(page).to have_field 'event[remarks]'
      end
      it '公開設定フォームが表示される' do
        expect(page).to have_field 'event[release]'
      end
      it 'タグフォームが表示される' do
        expect(page).to have_field 'event[tag_ids]'
      end
    end
    context '投稿成功のテスト' do
      before do
        fill_in 'event[name]', with: Faker::Lorem.characters(number: 5)
        fill_in 'event[start_time]', with: Faker::Time.between(from: DateTime.current + 1, to: DateTime.current + 2)
        fill_in 'event[end_time]', with: Faker::Time.between(from: DateTime.current + 3, to: DateTime.current + 4)
      end
      it '予定が正しく保存される' do
        expect { click_button '登録する' }.to change(user.events, :count).by(1)
      end
      it 'リダイレクト先が、予定一覧画面になっている' do
        click_button '登録する'
        expect(current_path).to eq '/events'
      end
      it '登録成功メッセージが表示される' do
        click_button '登録する'
        expect(page).to have_content '予定が登録されました'
      end
    end
    # context '投稿失敗のテスト' do
    #   context '空欄の際のメッセージ' do
    #     before do
    #       click_button '登録する'
    #     end
    #     it 'タイトルエラーメッセージが表示される' do
    #       expect(page).to have_content 'タイトルを入力してください'
    #     end
    #     it '時間エラーメッセージが表示される' do
    #       expect(page).to have_content '開始時刻を入力してください'
    #     end
    #     it '時間エラーメッセージが表示される' do
    #       expect(page).to have_content '終了時刻を入力してください'
    #     end
    #   end
    #   context '無効な入力内容のメッセージ' do
    #     it 'タイトルは20文字以内' do
    #       fill_in 'event[name]', with: Faker::Lorem.characters(number: 21)
    #       click_button '登録する'
    #       expect(page).to have_content 'タイトルは20文字以内で入力してください'
    #     end
    #     it 'タイトルは20文字以内' do
    #       fill_in 'event[place]', with: Faker::Lorem.characters(number: 21)
    #       click_button '登録する'
    #       expect(page).to have_content '場所は20文字以内で入力してください'
    #     end
    #     it '終了時間は開始時間よりも後の時間' do
    #       fill_in 'event[start_time]', with: Faker::Time.between(from: DateTime.current + 3, to: DateTime.current + 4)
    #       fill_in 'event[end_time]', with: Faker::Time.between(from: DateTime.current + 1, to: DateTime.current + 2)
    #       click_button '登録する'
    #       expect(page).to have_content '終了時刻は開始時刻より遅い時間を選択してください'
    #     end
    #   end
    end
  end

  describe '予定詳細のテスト' do
    before do
      visit event_path(event)
    end
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/events/' + event.id.to_s
      end
      it '予定の時間が表示されている' do
        expect(page).to have_content event.start_time.strftime('%m/%d %H:%M:%S')
        expect(page).to have_content event.end_time.strftime('%m/%d %H:%M:%S')
      end
      it '予定の名前が表示されている' do
        expect(page).to have_content event.name
      end
      it '予定の場所が表示されている' do
        expect(page).to have_content event.place
      end
      it '予定の詳細が表示されている' do
        expect(page).to have_content event.detail
      end
      it '予定の備考が表示されている' do
        expect(page).to have_content event.remarks
      end
      it '予定の編集リンクが表示される' do
        expect(page).to have_link '予定の変更', href: edit_event_path(event)
      end
      it '予定の削除リンクが表示される' do
        expect(page).to have_link '予定の削除', href: event_path(event)
      end
      it 'map検索フォームが表示される' do
        expect(page).to have_field '検索'
      end
      it 'map検索ボタンが表示される' do
        expect(page).to have_button '検索'
      end
      it 'mapのnameフォームが表示される' do
        expect(page).to have_field 'map[name]'
      end
      it 'mapの保存ボタンが表示される' do
        expect(page).to have_button '保存'
      end
    end
    context 'リンクの確認' do
      it '編集ページへ移動する' do
        click_link '予定の変更'
        expect(current_path).to eq '/events/' + event.id.to_s + '/edit'
      end
      it '予定を削除できる' do
        expect { click_link '予定の削除' }.to change(user.events, :count).by(-1)
      end
    end
  end
  describe '予定編集のテスト' do
    before do
      visit edit_event_path(event)
    end
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/events/' + event.id.to_s + '/edit'
      end
      it 'タイトルフォームが表示される' do
        expect(page).to have_field 'event[name]'
      end
      it '場所フォームが表示される' do
        expect(page).to have_field 'event[place]'
      end
      it '開始時間フォームが表示される' do
        expect(page).to have_field 'event[start_time]'
      end
      it '終了時間フォームが表示される' do
        expect(page).to have_field 'event[end_time]'
      end
      it '詳細フォームが表示される' do
        expect(page).to have_field 'event[detail]'
      end
      it '備考フォームが表示される' do
        expect(page).to have_field 'event[remarks]'
      end
      it '公開設定フォームが表示される' do
        expect(page).to have_field 'event[release]'
      end
      it 'タグフォームが表示される' do
        expect(page).to have_field 'event[tag_ids]'
      end
    end
    context '編集成功のテスト' do
      before do
        @old_name = event.name
        fill_in 'event[name]', with: Faker::Lorem.characters(number: 4)
        click_button '更新する'
      end
      it '編集内容が正しく反映される' do
        expect(event.reload.name).not_to eq @old_name
      end
    end
  end
end
