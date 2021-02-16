class Tweet < ApplicationRecord
  validates :content, presence: true

  has_rich_text :content

  default_scope -> { order(created_at: :desc) }

  after_create_commit { broadcast_prepend_to "tweets" }
  after_update_commit { broadcast_replace_to "tweets" }
  after_destroy_commit { broadcast_remove_to "tweets" }
end
