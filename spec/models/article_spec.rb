# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Article, type: :model do
  context "タイトルが入力されている場合" do
    let(:article) { build(:article) }

    it "記事が作成できる" do
      expect(article).to be_valid
    end
  end

  context "タイトルが入力されていない場合" do
    let(:article) { build(:article, title: nil) }

    it "記事が作成できない" do
      expect(article).not_to be_valid
    end
  end
end
