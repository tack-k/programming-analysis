require 'rails_helper'

RSpec.describe "メッセージ投稿", type: :system do
  before do
    @message = FactoryBot.create(:message, admin_id: '')
    @admin = FactoryBot.create(:admin)
    @user = @message.user
  end
  
  context 'メッセージが投稿できる場合' do
    it 'ログインユーザーはメッセージを投稿できる' do
      #ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      #チャットを開始をクリックする
      find('input[name="commit"]').click
      #フォームにメッセージを入力する
      fill_in 'message-text', with: @message.message
      #送信をクリックするとメッセージモデルのカウントが1増える
      expect{find('input[name="commit"]').click}.to change {Message.count}.by(1)
      #チャット終了リンクが有ることを確認する
      expect(page).to have_link 'チャット終了'
      #チャットを終了するをクリックする
      click_link 'チャット終了'
      #終了ページに遷移している
      expect(current_path).to eq finish_studies_path
      #もう一度診断するのリンクがある
      expect(page).to have_link 'もう一度診断する'
      #もう一度診断するをクリックする
      click_link 'もう一度診断する'
      #トップページに遷移している
      expect(current_path).to eq root_path
    end
  end

  context 'メッセージが投稿できない場合' do
    it 'メッセージを入力しないと投稿できない' do
      #ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      #チャットを開始をクリックする
      find('input[name="commit"]').click
      #フォームにメッセージを入力する
      fill_in 'message-text', with: ''
      #送信をクリックするとメッセージモデルのカウントが変わらない
      expect{find('input[name="commit"]').click}.to change {Message.count}.by(0)
    end
  end
end