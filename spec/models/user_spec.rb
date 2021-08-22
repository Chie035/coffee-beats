require 'rails_helper'

RSpec.describe "Userモデルのテスト" do
  describe "バリデーションのテスト"do
    subject { user.valid? }

    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }

    context "nameカラム" do
      it "空欄でないこと" do
        user.name = ''
        is_expected.to eq false
      end
      it "2文字以上であれば〇" do
        user.name = Faker::Lorem.characters(number: 5)
        is_expected.to eq true
      end
      it "2文字以下であれば×" do
        user.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it "一意性があるか" do
        user.name = other_user.name
        is_expected.to eq false
      end
    end

    context "introductionカラム" do
      it "100文字以下なら〇" do
        user.introduction = Faker::Lorem.characters(number: 100)
      end
      it "101文字以上なら×" do
        user.introduction = Faker::Lorem.characters(number: 101)
      end
    end


  end

  describe "アソシエーション" do
      context "PostArticleモデルとの関係" do
        it "1:Nになっているか" do
          expect(User.reflect_on_association(:post_articles).macro).to eq :has_many
        end
      end
  end
end