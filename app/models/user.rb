class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :without_user, lambda { |user| where("id <> :id", :id => user.id) }

  STATUSES = {:in => 0, :out => 1}.freeze

  validates :status, :inclusion => {:in => STATUSES.keys}

  def full_name
    [first_name, last_name].join(" ")
  end

  def status=(val)
    write_attribute(:status, STATUSES[val.intern])
  end

  def status
    STATUSES.key(read_attribute(:status))
  end

end
