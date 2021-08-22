require 'rails_helper'

describe "ログイン前のテスト" do
  describe "Top画面テスト" do
    before do
      visit root_path
    end

    context "表示確認テスト" do
      it 'TOPのURLが"/"になっているか' do
        expect(current_path).to eq "/"
      end

      it 'Loginリンクが表示される：左上から４番目のリンクがLoginリンク' do
        login_link = find_all("a")[3].native.inner_text
        expect(login_link).to match(/login/i)
      end
      it 'Loginリンクの内容が正しい' do
        login_link = find_all("a")[3].native.inner_text
        expect(page).to have_link login_link, href: new_user_session_path
      end
      it 'signupリンクが表示される：左上から３番目のリンクがSignupリンク' do
        signup_link = find_all("a")[2].native.inner_text
        expect(signup_link).to match(/signup/i)
      end
      it 'signupリンクの内容が正しい' do
        signup_link = find_all("a")[2].native.inner_text
        expect(page).to have_link signup_link, href: new_user_registration_path
      end
      it 'aboutリンクが表示される：左上から２番目のリンクがaboutリンク' do
        about_link = find_all("a")[1].native.inner_text
        expect(page).to have_link about_link, href: about_path
      end

    end

  end

  describe "about画面のテスト" do
    before do
      visit about_path
    end
    context "表示内容確認" do
      it "URLは正しいか" do
        expect(current_path).to eq "/about"
      end

    end
  end

  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
      it '「新規登録」と表示される' do
        expect(page).to have_content '新規登録'
      end
      it 'nameフォームが表示される' do
        expect(page).to have_field 'user[name]'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it '新規登録ボタンが表示される' do
        expect(page).to have_button '新規登録'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button '新規登録' }.to change(User.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、Communicate一覧になっている' do
        click_button '新規登録'
        expect(current_path).to eq '/post_articles'
      end
    end
  end

  describe 'ユーザログイン' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
      it '「ログイン」と表示される' do
        expect(page).to have_content 'ログイン'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'Log inボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
      it 'nameフォームは表示されない' do
        expect(page).not_to have_field 'user[name]'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'user[email]', with: user.name
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
      end

      it 'ログイン後のリダイレクト先が、Communicate一覧になっている' do
        expect(current_path).to eq '/post_articles'
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end

end