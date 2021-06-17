require 'rails_helper'

RSpec.describe User, type: :system do

  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'aboutへのリンクがある' do
        click_link 'About'
        expect(current_path).to eq '/about'
      end
      it '新規登録画面へのリンクがある' do
        click_link '新規登録', match: :first
        expect(current_path).to eq '/users/sign_up'
      end
      it 'ログイン画面へのリンクがある' do
        click_link 'ログイン', match: :first
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end

  describe 'ユーザー新規登録のテスト' do
    before do
      visit new_user_registration_path
    end
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
      it '「新規会員登録」と表示される' do
        expect(page).to have_content '新規会員登録'
      end
      it 'ユーザーネームフォームがある' do
        expect(page).to have_field 'user[name]'
      end
      it 'メールアドレスフォームがある' do
        expect(page).to have_field 'user[email]'
      end
      it 'パスワードフォームがある' do
        expect(page).to have_field 'user[password]'
      end
      it 'パスワード確認フォームがある' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it '会員登録ボタンが表示される' do
        expect(page).to have_button '会員登録'
      end
    end
    context '新規登録のテスト' do
      before do
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 5)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: '123456'
        fill_in 'user[password_confirmation]', with: '123456'
      end
      it '正しく新規登録される' do
        expect { click_button '会員登録' }.to change(User.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、予定の一覧画面になっている' do
        click_button '会員登録'
        expect(current_path).to eq '/events'
      end
    end
  end

  describe 'ユーザーログインのテスト' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
    end
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
      it '「ログイン」と表示される' do
        expect(page).to have_content 'ログイン'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'ログインボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
    end
    context 'ログイン成功のテスト' do
      before do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
      end
      it 'ログイン後のリダイレクト先が、予定一覧ページになっている' do
        expect(current_path).to eq '/events'
      end
    end
    context 'ログイン失敗のテスト' do
      before do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'
      end
      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end

  describe 'ログイン後の内容' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end
    describe 'ヘッダー' do
      context '表示内容の確認' do
        it 'Homeリンクが表示される: 左上のリンクが「detail」である' do
          home_link = find_all('a')[0].native.inner_text
          expect(home_link).to match "detail"
        end
        it 'eventsリンクが表示される: 左から2番目のリンクが「今月の予定」である' do
          events_link = find_all('a')[1].native.inner_text
          expect(events_link).to match "今月の予定"
        end
        it 'groupsリンクが表示される: 左から3番目のリンクが「グループ」である' do
          groups_link = find_all('a')[2].native.inner_text
          expect(groups_link).to match "グループ"
        end
        it 'MyPageリンクが表示される: 左から4番目のリンクが「マイページ」である' do
          my_page_link = find_all('a')[3].native.inner_text
          expect(my_page_link).to match "マイページ"
        end
        it 'ログインユーザーの名前が表示される' do
          expect(page).to have_content user.name
        end
      end
    end
    describe 'マイページ関連' do
      before do
        visit my_page_users_path
      end
      context '表示内容の確認' do
        it 'ユーザーネームが表示される' do
          expect(page).to have_content user.name
        end
        it 'ユーザーのemailが表示される' do
          expect(page).to have_content user.email
        end
        it '編集ページへのリンクがある' do
          user_edit_link = find_all('a')[5].native.inner_text
          expect(user_edit_link).to match "編集する"
        end
      end
      context 'リンク移動のテスト' do
        it '編集ページへ移動する' do
          click_link '編集する'
          expect(current_path).to eq '/users/' + user.id.to_s + '/edit'
        end
      end
    end
    describe 'ユーザー編集ページ' do
      before do
        visit edit_user_path(user.id)
      end
      context '表示内容の確認' do
        it 'name編集フォームが表示される' do
          expect(page).to have_field 'user[name]', with: user.name
        end
        it 'email編集フォームが表示される' do
          expect(page).to have_field 'user[email]', with: user.email
        end
        it '更新ボタンが表示される' do
          expect(page).to have_button '情報を更新'
        end
        it '退会ページへのリンクが表示される' do
          expect(page).to have_link '退会する', href: quit_users_path
        end
      end
      context '編集成功のテスト' do
        before do
          @old_name = user.name
          @old_email = user.email
          fill_in 'user[name]', with: Faker::Lorem.characters(number: 4)
          fill_in 'user[email]', with: Faker::Internet.email
          click_button '情報を更新'
        end
        it 'nameが正しく更新される' do
          expect(user.reload.name).not_to eq @old_name
        end
        it 'emailが正しく更新される' do
          expect(user.reload.email).not_to eq @old_email
        end
        it 'リダイレクト先が、MtPageになっている' do
          expect(current_path).to eq '/users/my_page'
        end
      end

    end
  end

end