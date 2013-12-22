require 'ipaddr'
class RandomIPAddr
  attr_reader :addr

  def initialize
    set_ip_sub_v4
    @addr = IPAddr.new(ipv4)
  end

  def set_ip_sub_v4
    loop do
      @ip_v4 = new_ip
      @subnet_v4 = subnet
      break if @subnet_v4
    end
  end

  def klass_a?
    return true if o1_to_b =~ /^0/
    false
  end

  def klass_b?
    return true if o1_to_b =~ /^10/
    false
  end

  def klass_c?
    return true if o1_to_b =~ /^110/
    false
  end

  def o1_to_b
    "%08b" % @ip_v4[0]
  end

  def first
    @addr.to_range.first
  end

  def last
    @addr.to_range.last
  end

  def ipv4
    @ip_v4.join('.') + "/" + @subnet_v4.to_s
  end

  def new_ip
    ip = []
    for i in (1..4)
      ip << rand(256)
    end
    ip
  end

  def to_s
    @ip_v4.join(".")
  end

  def subnet
    if klass_a?
      rand(23) + 8
    elsif klass_b?
      rand(19) + 12
    elsif klass_c?
      rand(15) + 16
    else
      false
    end
  end
end
