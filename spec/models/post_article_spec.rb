require 'rails_helper'

RSpec.describe 'PostArticleモデルのテスト' do
  describe "バリデーションテスト" do
    subject { post_article.valid? }
  
    let(:user) { create(:user) }
    let!(:post_article) { build(:post_article, user_id: user.id) }
  
    context "bodyカラム" do
      it "空欄でない"do
        post_article.body = ''
        is_expected.to eq false
      end
      it "3文字以上なら〇"do
        post_article.body = Faker::Lorem.characters(number:5)
        is_expected.to eq true
      end
      it "3文字以下なら×"do
        post_article.body = Faker::Lorem.characters(number:2)
        is_expected.to eq false
      end
      
    end
  end
  
  describe "アソシエーション"do
    context "Userモデルとの関係"do
      it "N:1になっている"do
        expect(PostArticle.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
  
end