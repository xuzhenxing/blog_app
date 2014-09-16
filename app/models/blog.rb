class Blog < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
  	default_scope -> { order('created_at DESC') }
  	validates :title, presence: true, length: { maximum: 40 }
  	validates :body, presence: true, length: { maximum: 5000 }
  	validates :user_id, presence: true

	def User.hash(token)
    	Digest::SHA1.hexdigest(token.to_s)
	end

	def feed
    	Comment.where("blog_id = ?",id)
	end

end
