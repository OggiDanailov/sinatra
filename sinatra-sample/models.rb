class User < ActiveRecord::Base
has_many :blogs
validates :username, presence: true, uniqueness: true
validates :password, presence: true
end

class Blog < ActiveRecord::Base
belongs_to :user, dependent: :destroy
end