require 'rails_helper'

RSpec.describe Map, type: :system do
  let(:user) { create(:user) }
  let!(:event) { create(:event, user: user) }
  let!(:map) { create(:map, event: event) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end
  describe 'Map登録のテスト' do
    before do
      visit event_path(event)
    end
    it '表示内容の確認'  do
      expect(page).to have_content map.name
    end
  end

end