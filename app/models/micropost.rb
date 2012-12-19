class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
	default_scope order: 'microposts.created_at DESC'

  validates_presence_of :user_id
  validates :content, presence: true, length: { maximum: 140 }
  
  def index
  end

  def show
  end


end
