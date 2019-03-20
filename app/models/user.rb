class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable


	protected

	enum role: { registered: 0, journalist: 2 }
end
