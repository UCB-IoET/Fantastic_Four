require "cord"
require "storm" 
require "svcd"


SVCD.init(nil,function()
    print("listener init")
end)

storm.os.invokePeriodically(3*storm.os.SECOND,function()
        print "going to write"
        SVCD.write("fe80::212:6d02:0:3035",0x3009,0x4012,storm.mp.pack("low"),5000,function()
            print "I wrote things"
        end)
    end)

cord.enter_loop()
