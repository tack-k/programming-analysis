require 'rails_helper'

RSpec.describe 'ルーム作成', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @admin = FactoryBot.create(:admin)
  end

  context 'ルームが作成できる場合' do
    it 'ルームを作成していないログインユーザーはルームを作成できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      # room#newに遷移している
      expect(current_path).to eq new_room_path
      # チャット開始ボタンをクリックすると、Roomモデルのカウントが1増える
      @room = FactoryBot.create(:room)
      expect {find('input[name="commit"]').click}.to change {Room.count}.by(1)
      # チャット画面に遷移する
      expect(current_path).to eq room_messages_path(@room.id + 1)
    end
  end

  context 'ルームが作成できない場合' do
    it 'ルームを作成しているユーザーはルームを作成できない' do
      @room = FactoryBot.create(:room, user_id: @user.id)
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      # room#loginに遷移している
      expect(current_path).to eq login_rooms_path
      # チャット開始ボタンをクリックしても、Roomモデルのカウントは変わらない
      expect {find('.guide-room-btn').click}.to change {Room.count}.by(0)
      # チャット画面に遷移することを確認
      expect(current_path).to eq room_messages_path(@room.id)
    end
  end
end
