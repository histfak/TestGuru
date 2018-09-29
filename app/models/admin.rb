class Admin < User
  validates :first_name, :last_name, presence: true

  def self.admin_email
    User.find_by(name: ADMIN).email
  end
end
