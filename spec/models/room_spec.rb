require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '管理者登録機能' do
    before do
      @room = FactoryBot.build(:room)
    end

    context 'データが登録できる場合' do
      it '全て値が存在している' do
        expect(@room).to be_valid
      end

      context 'データが登録できない場合' do
        it 'user_idが重複している' do
          @room.save
          another_room = FactoryBot.build(:room)
          another_room.user_id = @room.user_id
          another_room.valid?
          expect(another_room.errors.full_messages).to include('Userはすでに存在します')
        end
      end
    end
  end
end
