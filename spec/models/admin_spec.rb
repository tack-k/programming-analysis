require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe '管理者登録機能' do
    before do
      @admin = FactoryBot.build(:admin)
    end

    context 'データが登録できる場合' do
      it '全て値が存在している' do
        expect(@admin).to be_valid
      end

      it 'passwordが8文字以上でpassword_confirmationと一致している' do
        @admin.password = '1234abcd'
        @admin.password_confirmation = @admin.password
        expect(@admin).to be_valid
      end

      context 'ユーザー登録できない場合' do
        it 'nameが空' do
          @admin.name = nil
          @admin.valid?
          expect(@admin.errors.full_messages).to include('氏名を入力してください')
        end

        it 'emailが空' do
          @admin.email = nil
          @admin.valid?
          expect(@admin.errors.full_messages).to include('メールアドレスを入力してください')
        end

        it 'emailが重複' do
          @admin.save
          another = FactoryBot.build(:admin)
          another.email = @admin.email
          another.valid?
          expect(another.errors.full_messages).to include('メールアドレスはすでに存在します')
        end

        it 'emailに@が含まれていない' do
          @admin.email = 'abc'
          @admin.valid?
          expect(@admin.errors.full_messages).to include('メールアドレスは不正な値です')
        end

        it 'passwordが空' do
          @admin.password = nil
          @admin.valid?
          expect(@admin.errors.full_messages).to include('パスワードを入力してください')
        end

        it 'passwordが7文字以下' do
          @admin.password = '1234aaa'
          @admin.valid?
          expect(@admin.errors.full_messages).to include('パスワードは8文字以上で入力してください')
        end

        it 'passwordconfimationがpasswordと一致していない' do
          @admin.save
          @admin.password_confirmation = ''
          @admin.valid?
          expect(@admin.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
        end
      end
    end
  end
end
