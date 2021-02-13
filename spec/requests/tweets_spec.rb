 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/tweets", type: :request do
  # Tweet. As you add validations to Tweet, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Tweet.create! valid_attributes
      get tweets_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      tweet = Tweet.create! valid_attributes
      get tweet_url(tweet)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_tweet_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      tweet = Tweet.create! valid_attributes
      get edit_tweet_url(tweet)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Tweet" do
        expect {
          post tweets_url, params: { tweet: valid_attributes }
        }.to change(Tweet, :count).by(1)
      end

      it "redirects to the created tweet" do
        post tweets_url, params: { tweet: valid_attributes }
        expect(response).to redirect_to(tweet_url(Tweet.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Tweet" do
        expect {
          post tweets_url, params: { tweet: invalid_attributes }
        }.to change(Tweet, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post tweets_url, params: { tweet: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested tweet" do
        tweet = Tweet.create! valid_attributes
        patch tweet_url(tweet), params: { tweet: new_attributes }
        tweet.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the tweet" do
        tweet = Tweet.create! valid_attributes
        patch tweet_url(tweet), params: { tweet: new_attributes }
        tweet.reload
        expect(response).to redirect_to(tweet_url(tweet))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        tweet = Tweet.create! valid_attributes
        patch tweet_url(tweet), params: { tweet: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested tweet" do
      tweet = Tweet.create! valid_attributes
      expect {
        delete tweet_url(tweet)
      }.to change(Tweet, :count).by(-1)
    end

    it "redirects to the tweets list" do
      tweet = Tweet.create! valid_attributes
      delete tweet_url(tweet)
      expect(response).to redirect_to(tweets_url)
    end
  end
end
