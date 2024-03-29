# frozen_string_literal: true

require 'rails_helper'


RSpec.describe 'Likes', type: :request do
  let(:user) { create(:user) }
  let(:tweet) { create(:tweet) }

  before { sign_in user }

  describe 'POST create' do
    it 'likes once' do
      expect do
        post tweet_likes_path(tweet)
      end.to change { Like.count }.by(1)
    end
  end

  describe 'DELETE destroy' do
    it 'dislikes once' do
      like = create(:like, user: user, tweet: tweet)
      expect do
        delete tweet_like_path(tweet, like)
      end.to change { Like.count }.by(-1)
    end
  end
end
