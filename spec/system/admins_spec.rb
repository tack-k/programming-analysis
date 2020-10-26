require 'rails_helper'

# RSpec.describe "管理者新規登録", type: :system do
#   before do
#     @admin = FactoryBot.build(:admin)
#   end

#   context '新規登録ができる場合' do
#     it '正しい情報を入力すれば新規登録でき、管理者一覧画面に遷移する' do
#       #ログイン画面に移動する
#       visit new_admin_session_path
#       #study#showページに[無料相談する]ボタンがある
#       expect(page).to have_link '新規登録はこちら'
#       #[新規登録はこちら]のリンクをクリックする
#       click_on '新規登録はこちら'
#       #新規登録ページへ遷移している
#       expect(current_path).to eq new_admin_registration_path
#       #ユーザー情報を入力する
#       fill_in '氏名', with: @admin.name
#       fill_in 'メールアドレス', with: @admin.email
#       fill_in 'パスワード', with: @admin.password
#       fill_in 'パスワード(確認)', with: @admin.password_confirmation
#       #会員登録ボタンを押すadminモデルカウントが1上がる
#       expect{find('input[name="commit"]').click}.to change {Admin.count}.by(1)
#       #管理者一覧ページへ遷移している
#       expect(current_path).to eq admins_index_path
#     end

#     it '正しくない情報を入力すると登録できず、管理者登録画面に戻される' do
#       #ログイン画面に移動する
#       visit new_admin_session_path
#       #study#showページに[無料相談する]ボタンがある
#       expect(page).to have_link '新規登録はこちら'
#       #[新規登録はこちら]のリンクをクリックする
#       click_on '新規登録はこちら'
#       #新規登録ページへ遷移している
#       expect(current_path).to eq new_admin_registration_path
#       #ユーザー情報を入力する
#       fill_in '氏名', with: ''
#       fill_in 'メールアドレス', with: ''
#       fill_in 'パスワード', with: ''
#       fill_in 'パスワード(確認)', with: ''
#       #会員登録ボタンを押してもユーザーモデルカウントは上がらない
#       expect{find('input[name="commit"]').click}.to change {Admin.count}.by(0)
#       #新規登録ページに戻されている
#       expect(current_path).to eq "/admins"
#     end
#   end
# end

# RSpec.describe "ログイン", type: :system do
#   before do
#     @user = FactoryBot.create(:user)
#   end
  
#   context 'ログインができる場合' do
#     it '保存されたユーザー情報と一致すればログインができ、@roomが作成されていればroom#loginに遷移する' do
#       @room = FactoryBot.create(:room, user_id: @user.id)
#       #トップページに移動する
#       visit root_path 
#       #[チャット相談]というリンクがある
#       expect(page).to have_link 'チャット相談'
#       #[チャット相談]をクリックする
#       click_on 'チャット相談'
#       #user#sign_inに遷移している
#       expect(current_path).to eq  new_user_session_path
#       #正しいメールアドレス、パスワードを入力する
#       fill_in 'メールアドレス', with: @user.email
#       fill_in 'パスワード', with: @user.password
#       #ログインボタンを押す
#       find('input[name="commit"]').click
#       #@roomが作成されていればroom#loginに遷移している
#       expect(current_path).to eq login_rooms_path
#     end

#     it '保存されたユーザー情報と一致すればログインができ、@roomが作成されていなければroom#newに遷移する' do
#       #トップページに移動する
#       visit root_path 
#       #[チャット相談]というリンクがある
#       expect(page).to have_link 'チャット相談'
#       #[チャット相談]をクリックする
#       click_on 'チャット相談'
#       #user#sign_inに遷移している
#       expect(current_path).to eq  new_user_session_path
#       #正しいメールアドレス、パスワードを入力する
#       fill_in 'メールアドレス', with: @user.email
#       fill_in 'パスワード', with: @user.password
#       #ログインボタンを押す
#       find('input[name="commit"]').click
#       #@roomが作成されていなけれroom#newに遷移している
#       expect(current_path).to eq new_room_path
#     end
#   end

#   context 'ログインができない場合' do
#     it '保存されたユーザー情報と一致しないときは、user#sign_inに戻される' do
#       @room = FactoryBot.create(:room, user_id: @user.id)
#       #トップページに移動する
#       visit root_path 
#       #[チャット相談]というリンクがある
#       expect(page).to have_link 'チャット相談'
#       #[チャット相談]をクリックする
#       click_on 'チャット相談'
#       #user#sign_inに遷移している
#       expect(current_path).to eq new_user_session_path
#       #誤ったメールアドレス、パスワードを入力する
#       fill_in 'メールアドレス', with: ''
#       fill_in 'パスワード', with: ''
#       #ログインボタンを押す
#       find('input[name="commit"]').click
#       #user#sign_inに戻される
#       expect(current_path).to eq new_user_session_path
#     end
#   end
# end
# end
