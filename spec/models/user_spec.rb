require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録機能' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'データが登録できる場合' do
      it '全て値が存在している' do
        expect(@user).to be_valid
      end

      it 'passwordが8文字以上の半角英数字かつpassword_confirmationと一致している' do
        @user.password = '1234abcd'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end

    context 'ユーザー登録できない場合' do
      
      it 'usernameが空' do
        @user.username = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('ユーザーネームを入力してください')
      end
      
      it 'emailが空' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      
      it 'emailが重複' do
        @user.save
        another = FactoryBot.build(:user)
        another.email = @user.email
        another.valid?
        expect(another.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      
      it 'emailに@が含まれていない' do
        @user.email = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end
      
      it 'result_idが空でない' do
        @user.result_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('診断結果を入力してください')
      end
      
      it 'passwordが空' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      
      it 'passwordが7文字以下' do
        @user.password = '1234aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは8文字以上で入力してください')
      end
      
      it 'passwordが数字のみ' do
        @user.password = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end

      it 'passwordが英字のみ' do
        @user.password = 'abcdefgh'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end

      it 'passwordに大文字が含まれている' do
        @user.password = '1234aaaあ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end

      it 'passwordconfimationがpasswordと一致していない' do
        @user.save
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

    end
      
    end
  end
end
