require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname、email、password、password_confirmation、first_name、given_name、first_name_kana、given_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@が含まれていたら登録できる' do
        @user.email = 's@s.com'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で半角英数字混合だったら登録できる' do
        @user.password = 'a0a0a0'
        @user.password_confirmation = 'a0a0a0'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以下なら登録できない' do
        @user.password = 'a0a0a'
        @user.password_confirmation = 'a0a0a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = '123456a'
        @user.password_confirmation = '1234567x'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'fitst_nameが空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが漢字、平仮名、カタカナ以外の入力では登録できない' do
      end
      it 'given_nameが空では登録できない' do
        @user.given_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name can't be blank")
      end
      it 'given_nameが漢字、平仮名、カタカナ以外の入力では登録できない' do
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaがカタカナ入力以外なら登録できない' do
      end
      it 'given_name_kanaが空では登録できない' do
        @user.given_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name kana can't be blank")
      end
      it 'given_name_kanaがカタカナ入力以外なら登録できない' do
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
