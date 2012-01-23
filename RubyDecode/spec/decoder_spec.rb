require 'decoder'

describe Decoder do  

  it "should decode this text1" do
    d = Decoder.new("1JKJ'pz'{ol'{yhklthyr'vm'{ol'Jvu{yvs'Kh{h'Jvywvyh{pvu5")
    t = d.decode()
    t == "*CDC is the trademark of the Control Data Corporation."
  end
  
  it "should decode this text2" do
    d = Decoder.new("1PIT'pz'h'{yhklthyr'vm'{ol'Pu{lyuh{pvuhs'I|zpulzz'Thjopul'Jvywvyh{pvu5")
    t = d.decode()
    t == "*IBM is a trademark of the International Business Machine Corporation."
  end
  
  it "should decode this text3" do
    d = Decoder.new("1KLJ'pz'{ol'{yhklthyr'vm'{ol'Kpnp{hs'Lx|pwtlu{'Jvywvyh{pvu5")
    t = d.decode()
    t == "*DEC is the trademark of the Digital Equipment Corporation."
  end
  
end

