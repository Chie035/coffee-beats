require 'rails_helper'

describe "Leaningのテスト" do
    describe "一覧画面のテスト" do
      before do
        visit articles_path
      end
      context "表示内容確認" do
        it "URLが正しいか" do
          expect(current_path).to eq "/articles"
        end
        it "「Leaning」と表示されているか" do
          expect(page).to have_content "Leaning"
        end
        it "「ReturnTOP」ボタンは表示されているか" do
          expect(page).to have_button "Return TOP"
        end
        it "「Return TOP」の遷移先は正しいか" do
          click_button "Return TOP"
          expect(page).to have_content_path root_path
        end
        
       end
    end
    
    describe "詳細画面テスト" do
      before do
        visit article_path(article)
       end
       context "表示内容確認" do
          it "URLは正しいか" do
            expect(current_path).to eq "/article" + article.id.to_s
          end
          it "タイトル・本文が表示されているか" do
            expect(page).to have_content article.title
            expect(page).to have_content article.body
          end
          it "「Return Index」ボタンが表示されているか" do
            expect(page).to have_button "Return Index"
          end
        end
    end
    
  end
  
  describe "Communicateのテスト" do
    describe "一覧画面テスト" do
      before do
        visit post_articles_path
      end
      context "表示内容の確認" do
        it "URLは正しいか" do
          expect(current_path).to eq "/post_articles"
        end
      end
    end
    
    describe "投稿テスト" do
      context "表示内容確認" do  
        it "投稿フォームが表示される" do
          expect(page).to have_field 'post_article[body]'
        end
        it "新規投稿ボタンが表示される" do
          expect(page).to have_button "新規投稿"
        end
      end
      
      context "投稿処理テスト" do
        it "投稿後のリダイレクト先は正しいか" do
          fill_in "post_article[body]", with: Faker::Lorem.characters(number:30)
          click_button "新規投稿"
          expect(page).to have_current_path post_articles_path
        end
      end
    end
    
    describe "投稿詳細画面テスト" do
      before do
        visit post_article_path(post_article)
      end
      context "表示内容確認" do
        it "URLの確認" do
          expect(current_path).to eq "/post_articles" + post_article.id.to_s
        end
        it "コメントフォームが表示されているか" do
          expect(page).to have_field "post_comment[coment]"
        end
        it "「コメント投稿」ボタンが表示されているか" do
          expect(page).to have_button "コメント投稿"
        end
        it "投稿者のユーザーネームが表示されているか" do
          expect(page).to have_content user.name
        end
        it "「一覧に戻る」ボタンが表示されているか" do
          expect(page).to have_button "一覧に戻る"
        end
        it "「一覧に戻る」ボタンのリンクは正しいか" do
          click_button "一覧に戻る"
          expect(page).to have_current_path post_articles_path
        end
      end
    end
  end