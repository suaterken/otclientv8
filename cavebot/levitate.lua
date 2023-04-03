-- Lee
CaveBot.Extensions.Levitate = {}
CaveBot.Extensions.Levitate.setup = function()
  CaveBot.registerAction("Levitate", "orange", function(value, retries)
    local val = string.split(value, ",")
    local spell = "exani hur"
    local floor
    if #val >= 1 then
      direction = tonumber(val[1])
    end
    if #val >= 2 then
      floor = tonumber(val[2])
    end
    if #val >= 3 then
      spell = val[3]
    end
    if #val == 4 then
      tries = tonumber(val[4])
    end

    if retries >= (tries and tries or 20) then
      print("CaveBot[Levitate]: too many tries")
      return false
    end

    if floor ~= posz() then
      return true
    end

    if direction ~= player:getDirection() then
      turn(direction)
      delay(500)
      return "retry"
    end

    if direction == 0 or direction == 3 then
      say(spell ..' up')
    else
      say(spell ..' down')
    end

    delay(1000)
    return "retry"
  end)

  CaveBot.Editor.registerAction("levitate", "levitate", {
    value=function() return player:getDirection() ..','.. posz() end,
    title="Levitate",
    description="levitate direction, floor z position, spellname (optional custom) and retries (optional)",
    multiline=false,
})
end