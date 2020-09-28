require 'rails_helper'

RSpec.describe Study, type: :model do

  describe 'サービスデータ登録機能' do
    before do
      @study = FactoryBot.build(:study)
      @study.method = "サービス名"
    end

    context 'データが登録できる場合' do
      it "全て値が存在している" do
        expect(@study).to be_valid
      end
  
      it "imageが空でない" do
        @study.image = nil
        @study.valid?
        expect(@study.errors.full_messages).to include("サービスイメージ画像を入力してください")
      end

      it "methodが空でない" do
        @study.method = nil
        @study.valid?
        expect(@study.errors.full_messages).to include("学習法を入力してください")
      end

      it "contentが空でない" do
        @study.content = nil
        @study.valid?
        expect(@study.errors.full_messages).to include("サービス内容を入力してください")
      end

      it "reasonが空でない" do
        @study.reason = nil
        @study.valid?
        expect(@study.errors.full_messages).to include("診断理由を入力してください")
      end

      it "priceが空でない" do
        @study.price = nil
        @study.valid?
        expect(@study.errors.full_messages).to include("サービス価格を入力してください")
      end

      it "urlが空でない" do
        @study.url = nil
        @study.valid?
        expect(@study.errors.full_messages).to include("サービスURLを入力してください")
      end
    end



  end
end
