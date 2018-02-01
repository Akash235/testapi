class JsonAuthService

  def self.check(header)

    num = JsonToken.where(token: header).ids
    numtos = num.to_s.split("[").last.split("]").first
    return numtos
  end





end