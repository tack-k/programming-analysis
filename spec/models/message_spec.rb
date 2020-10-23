require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'メッセージ投稿機能' do
    before do
    end
    
    context 'データが登録できる場合' do
      it 'メッセージとroom_idとadmin_idが存在している' do
        @message = FactoryBot.build(:message, user_id: '')
        @message.save
        expect(@message).to be_valid
      end
      
      it 'メッセージとroom_idとuser_idが存在している' do
        @message = FactoryBot.build(:message, admin_id: '')
        @message.save
        expect(@message).to be_valid
      end

      context 'データが登録できない場合' do
        it 'user_idとadmin_idが同時に存在する' do
          @message = FactoryBot.build(:message)
          @message.save
          @message.valid?
        expect(@message.errors.full_messages).to include('管理者かユーザーのどちらか一方のメッセージを送信してください')
        end

        it 'user_idとadmin_idが両方空欄' do
          @message = FactoryBot.build(:message, user_id: '', admin_id: '')
          @message.save
          @message.valid?
        expect(@message.errors.full_messages).to include('管理者かユーザーのどちらか一方のメッセージを送信してください')
        end
      end
    end
  end
end
