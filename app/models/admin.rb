class Admin < User
  validates :first_name, :last_name, presence: true

  def self.main_admin
    User.find_by(name: ADMIN)
  end
end
