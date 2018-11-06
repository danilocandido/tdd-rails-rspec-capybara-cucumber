class Achievement < ApplicationRecord
  enum privacy: %i[public_access private_access friends_access]
end
