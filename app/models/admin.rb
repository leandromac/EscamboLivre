class Admin < ActiveRecord::Base
    enum role: [:full_access, :restricted_access]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    def role_type
        if self.role == 'full_access'
            'Super user'
        else
            'Manager'
        end
    end

end
