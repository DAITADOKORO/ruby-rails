group :development, :test do
 ...
  gem 'rspec-rails', '~> 3.7'
  gem 'factory_bot_rails', '~> 4.11'
  gem 'faker'
end

# 自動で作られたテストディレクトリを削除しておく
rm -r ./test

spec/spec_helper.rb の書き換え

# See https://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

require 'capybara/rspec'

RSpec.congigure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium_chrome_headless
  end

# rspec-expectations config goes here. You can use an alternate




# factorybotによるユーザー作成一例

spec/fatroies/users.rb

FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'test1@example.com' }
    password { 'password' }
  end
end

# 関連付けされたモデルをfactorybotで表現するには

FactoryBot.define do
  factory :task do
    title { 'テスト' }
    user # 定義した :userというFactoryを関連付けて生成
  end
end

# beforeなどで呼び出したい時の表記

user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
# この場合、passwordは上記で定義された'password'のまま
# buildにすると、データベース登録前で止めて、未保存のオブジェクトを得られる。


# spec/system/tasks_spec.rbの全体像一例

require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    #ここでlet! とすると、beforeの前にユーザーが登録できる。必須データの登録時に。
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }

    before do
      FactoryBot.create(:task, name: '最初のタスク', user: user_a) # ここでユーザーAが登録される
      visit login_path
      fill_in 'メールアドレス', with: login_user.email #下記のlet(:login_user)から受け取る
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end

    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a } # どのユーザーにするか選択している

      it 'ユーザーAが作成したタスクが表示される' do
        expect(page).to_have_content '最初のタスク'
      end
    end

    context 'ユーザーBがログインしている時' do
      let(:login_user) { user_b }

      it 'ユーザーAが作成したタスクが表示されない' do
        expect(page).to have_no_ncontent '最初のタスク'
      end
    end
  end
end

# bundle exec rspec spec/system/tasks_spec.rb
