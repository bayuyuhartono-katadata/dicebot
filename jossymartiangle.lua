
-- 7 max losses (ludicrous) - 27.364138
-- 8 max losses (stupid) - 7.3446286
-- 9 max losses (risky) - 1.9714477
-- 10 max losses (safe) - 0.5291766
-- 11 max losses (safest) - 0.1420417
-- 12 max losses (ultra-safe) - 0.03812690
-- 13 max losses (super-ultra-safe) - 0.01023403

betcalc = 0
-------------------------------------------
bethigh = true
stopnow = false
first = true
done = true
chance = 27.5
base = balance * (betcalc / 100000)
curbet = base * 3.7255
nextbet = base
resetseed()
resetstats()

function dobet()

  base = balance * (betcalc / 100000)

  if (lastBet.nonce>=50000) then
    resetseed()
    resetstats()
  end

  if (betcalc < 0.01) then
    print("Please set betcalc then restart the script")
    stop() end

  if (first) then
    if(stopnow) then stop() end
    if !win then
      chance = 50
      nextbet = curbet
      first = false
      done = true
    end
  end

  if(!first and !done) then
    if(stopnow) then stop() end
    if win then
      chance = 27.5
      curbet = base * 3.7255
      nextbet = base
      first = true
      done = true
    else
      curbet = curbet * 3.7255
      nextbet = curbet
      chance = 72.5
    end
  end
  done = false
end
