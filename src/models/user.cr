class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  table do
    column email : String
    column encrypted_password : String
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end

  def admin?
    ENV.fetch("APP_ADMIN").includes? self.email
  end
end
