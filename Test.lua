function OnAllTrade (alltrade)
    if string.find(ticker_list, alltrade.sec_code) ~= nil then
    last_price[alltrade.sec_code]=alltrade.price
    
    if alltrade.sec_code==speed_check then
        time_diff=os.clock()-remember_time
        remember_time=os.clock()
        local datatime_table=alltrade.datetime
        toLog (log, speed_check.." пишет OnAllTrade "..alltrade.price.." time="..datatime_table.hour..":"..datatime_table.min..":"..datatime_table.sec.." "..datatime_table.ms.." "..datatime_table.mcs.." time_diff="..math.ceil(time_diff*1000))
    end
    
    end
end

 function OnParam (class, sec)
     if string.find(ticker_list,sec)~=nil then --and class=="TQBR" нужен если есть классы с такими же акци¤ми.
     
        if sec==speed_check and last_price[sec]~=getParam(sec,'last') then
            time_diff=os.clock()-remember_time
            remember_time=os.clock()
            toLog (log, speed_check.." пишет OnParam "..getParam(sec,'last').." time_diff="..math.ceil(time_diff*1000))
        end 
        
        if last_price[sec]~=getParam(sec,'last') then
            last_price[sec]=getParam(sec,'last')
        end

     end
 end

 function mycallbackforallstocks(class,sec,index)         
    local num_candles=ds[sec]:Size() 
    if index==num_candles then        
        if sec==speed_check then
            time_diff=os.clock()-remember_time
            remember_time=os.clock()        
            toLog (log, speed_check.." пишет DataSource "..ds[sec]:C(num_candles).." time_diff="..math.ceil(time_diff*1000))
        end 
        last_price[sec]=ds[sec]:C(num_candles)     
     end


end

function DataSource(class,sec,interval)
   ds[sec] = CreateDataSource(class,sec,interval)
   ds[sec]:SetUpdateCallback(function(...) mycallbackforallstocks(class,sec,...) end)
   return ds[sec]
end