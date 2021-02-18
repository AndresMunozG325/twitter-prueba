json.extract! tweet, :id, :contents, :user_id, :tweet_id, :user_id, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
