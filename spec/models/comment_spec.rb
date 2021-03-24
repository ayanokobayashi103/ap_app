require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーションのテスト' do
    it 'コメントが空欄でない' do
      comment = Comment.new( content: '' )
      expect(comment).not_to be_valid
    end
  end
end
