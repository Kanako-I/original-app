require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録(非正常確認）' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailは＠を含まないと登録できないこと' do
      @user.email = 'aaasample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it "passwordが空では登録できないこと" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordは半角英字が入ってないと登録できないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordは半角数字が入ってないと登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "residentが空では登録できないこと" do
      @user.resident_id = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Resident can't be blank")
    end

    it "residentがid1では登録できないこと" do
      @user.resident_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("Resident must be other than 1")
    end

    it "ageが空では登録できないこと" do
      @user.age_id = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Age can't be blank")
    end

    it "ageがid1では登録できないこと" do
      @user.age_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("Age must be other than 1")
    end

    it "occupationが空では登録できないこと" do
      @user.occupation_id = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Occupation can't be blank")
    end

    it "occupationがid1では登録できないこと" do
      @user.occupation_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("Occupation must be other than 1")
    end
  end

  describe 'ユーザー新規登録（正常確認）' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '123aaa'
      @user.password_confirmation = '123aaa'
      expect(@user).to be_valid
    end

    it '新規登録画面の項目すべて正しければ登録できること' do
      expect(@user).to be_valid
    end
  end
end