require 'rails_helper'

RSpec.describe "管理者新規登録", type: :system do
  before do
    @admin = FactoryBot.build(:admin)
  end

  context '新規登録ができる場合' do
    it '正しい情報を入力すれば新規登録でき、管理者一覧画面に遷移する' do
      #ログイン画面に移動する
      visit new_admin_session_path
      #study#showページに[無料相談する]ボタンがある
      expect(page).to have_link '新規登録はこちら'
      #[新規登録はこちら]のリンクをクリックする
      click_on '新規登録はこちら'
      #新規登録ページへ遷移している
      expect(current_path).to eq new_admin_registration_path
      #ユーザー情報を入力する
      fill_in '氏名', with: @admin.name
      fill_in 'メールアドレス', with: @admin.email
      fill_in 'パスワード', with: @admin.password
      fill_in 'パスワード(確認)', with: @admin.password_confirmation
      #会員登録ボタンを押すadminモデルカウントが1上がる
      expect{find('input[name="commit"]').click}.to change {Admin.count}.by(1)
      #管理者一覧ページへ遷移している
      expect(current_path).to eq admins_index_path
    end

    it '正しくない情報を入力すると登録できず、管理者登録画面に戻される' do
      #ログイン画面に移動する
      visit new_admin_session_path
      #study#showページに[無料相談する]ボタンがある
      expect(page).to have_link '新規登録はこちら'
      #[新規登録はこちら]のリンクをクリックする
      click_on '新規登録はこちら'
      #新規登録ページへ遷移している
      expect(current_path).to eq new_admin_registration_path
      #ユーザー情報を入力する
      fill_in '氏名', with: ''
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      fill_in 'パスワード(確認)', with: ''
      #会員登録ボタンを押してもユーザーモデルカウントは上がらない
      expect{find('input[name="commit"]').click}.to change {Admin.count}.by(0)
      #新規登録ページに戻されている
      expect(current_path).to eq "/admins"
    end
  end
end

RSpec.describe "ログイン", type: :system do
  before do
    @admin = FactoryBot.create(:admin)
  end
  
  context 'ログインができる場合' do
    it '保存された管理者情報と一致すればログインができる' do
      #ログイン画面に移動する
      visit new_admin_session_path 
      #正しいメールアドレス、パスワードを入力する
      fill_in 'メールアドレス', with: @admin.email
      fill_in 'パスワード', with: @admin.password
      #ログインボタンを押す
      find('input[name="commit"]').click
      #管理者一覧ページに遷移している
      expect(current_path).to eq admins_index_path
    end
  end

  context 'ログインができない場合' do
    it '保存された管理者情報と一致しないときは、ログイン画面に戻される' do
      #ログイン画面に移動する
      visit new_admin_session_path 
      #誤ったメールアドレス、パスワードを入力する
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      #ログインボタンを押す
      find('input[name="commit"]').click
      #管理者一覧ページに遷移している
      expect(current_path).to eq new_admin_session_path
    end
  end
end


RSpec.describe "管理者編集", type: :system do
  before do
    @admin = FactoryBot.create(:admin)
  end
  
  context '管理者情報の編集ができる場合' do
    it 'ログインしたユーザーは自分の情報を編集できる' do
      #ログインする
      visit new_admin_session_path 
      fill_in 'メールアドレス', with: @admin.email
      fill_in 'パスワード', with: @admin.password
      find('input[name="commit"]').click
      expect(current_path).to eq admins_index_path
      #編集ボタンが有る
      expect(page).to have_link '編集'
      #編集ボタンをクリックする
      click_link '編集'
      #編集ページに遷移していることを確認
      expect(current_path).to eq edit_admin_registration_path
      #すでに登録済みの内容がフォームに入力されていることを確認する
      expect(find('#name').value).to eq @admin.name
      expect(find('#email').value).to eq @admin.email
      #新しい内容を入力する
      fill_in '氏名', with: '氏名編集'
      fill_in 'メールアドレス', with: 'edit@gmail.com'
      fill_in '新しいパスワード', with: '1234abcd'
      fill_in 'パスワード（確認用）', with: '1234abcd'
      fill_in '現在のパスワード', with: @admin.password
      #編集ボタンをクリックしてもAdminモデルのカウントは変わらないことを確認する
      expect{find('input[name="commit"]').click}.to change {Admin.count}.by(0)
      #管理者一覧画面に遷移したことを確認する
      expect(current_path).to eq admins_index_path     
    end
  end
end


RSpec.describe "管理者削除", type: :system do
  before do
    @admin = FactoryBot.create(:admin)
  end
  
  context '管理者情報の削除ができる場合' do
    it 'ログインしたユーザーは自分の情報を削除できる' do
      #ログインする
      visit new_admin_session_path 
      fill_in 'メールアドレス', with: @admin.email
      fill_in 'パスワード', with: @admin.password
      find('input[name="commit"]').click
      expect(current_path).to eq admins_index_path
      #削除ボタンが有ることを確認する
      expect(page).to have_link '削除', href: admin_registration_path
      #編集ボタンをクリックしてもAdminモデルのカウントが1減少することを確認する
      click_on '削除'
      #alrtが表示されることを確認する
      expect{
      expect(page.accept_confirm).to eq "本当に削除しますか?"
      sleep 0.5
      }.to change{Admin.count}.by(-1)
      #管理者一覧画面に遷移したことを確認する
      expect(current_path).to eq new_admin_session_path
    end
  end
end