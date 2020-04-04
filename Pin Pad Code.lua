UserPIN = Controls["Pins"][1].String --Declare Variables
UserPage = Controls["Pages"][1].String
AdminPIN = Controls["Pins"][2].String --Declare Variables
AdminPage = Controls["Pages"][2].String
LockPage = Controls["Lock Page"].String
Controls["UCI"].String = LockPage --Start UCI in Lock Page
ongoing = null
touchTimer = Timer.New()

for i=1,10 do
Controls["PinNum"][i].EventHandler = function() lock(i) end  --Assign EventHandler to inputs
end

function lock(current) --Parses the inputs
if current == 10 then current = 0 end --If button pressed is 0 make sure current shows correct
if ongoing==null then ongoing=current else --If nothing has been input yet, start ongoing
ongoing=ongoing..current --Append new digit to ongoing PIN
end
--print (ongoing) --Debug
end

function solve() --Select which interface depending on Pin, or reset if Pin wrong
if ongoing==UserPIN then Controls["UCI"].String=UserPage --Check if combo matches User PIN
print(os.date(), "Acess Granted User") --Debug
if Properties["Log Entries"] == true then Log.Message("Acess Granted User") end --Debug to Event Log
elseif ongoing==AdminPIN then Controls["UCI"].String=AdminPage --Check if combo matches Admin PIN
print(os.date(), "Access Granted Admin") --Debug
if Properties["Log Entries"] == true then Log.Message("Acess Granted Admin") end --Debug to Event Log
else wrong() --If combo does not match either then reset
end
ongoing=null
end

function wrong() --Reset if incorrect pin
print(os.date(), "Access Denied Wrong PIN - Resetting") --Debug
if Properties["Log Entries"] == true then Log.Message("Access Denied Wrong PIN - Resetting") end --Debug to Event Log
ongoing=null --Reset Ongoing
for i=1,10 do Controls["PinNum"][i].Color = "Red" end --Change Pin Pad color to red briefly
Timer.CallAfter(function() for i=1,10 do Controls["PinNum"][i].Color = "" end end ,.35)  --Reset Pin Pad color after delay "#FFC0BCBC"
end

--[[
--Booth TSC Timeout Relock
  BoothTSC["touched"].EventHandler = function()
  count = 0
  touchTimer:Stop()
  touchTimer:Start(1)
end
]]--
touchTimer.EventHandler = function()
  count = count+1
  if count == 30 then
    Controls.UCI.String = LockPage
    count = 0
    touchTimer:Stop()
  end
end

Controls["Reset"].EventHandler = function() wrong() end --Reset Combo
Controls["Submit"].EventHandler = function() solve() end --Check Combo
Controls["Pins"][1].EventHandler = function() UserPIN=Controls["Pins"][1].String end --Get combo for User Page
Controls["Pages"][1].EventHandler = function() UserPage = Controls["Pages"][1].String end --Get Page for User UCI
Controls["Pins"][2].EventHandler = function() AdminPIN=Controls["Pins"][2].String end --Get combo for Admin Page
Controls["Pages"][2].EventHandler = function() AdminPage = Controls["Pages"][2].String end --Get Page for Admin UCI
Controls["Lock Page"].EventHandler = function() LockPage = Controls["Lock Page"].String end --Get Page for Admin UCI
Controls["Logoff"].EventHandler = function() Controls["UCI"].String = LockPage end --Return to Lock Page (Logoff Button)