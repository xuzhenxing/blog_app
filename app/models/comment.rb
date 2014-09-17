class Comment < ActiveRecord::Base
	belongs_to :blog
	default_scope -> { order('created_at DESC') }
	validates :name, presence: true, length: { maximum: 20 }
	validates :content, presence: true, length: { maximum: 140 }
	validates :blog_id,presence:true
end
