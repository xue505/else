local robot = require("robot")
local comp = require("computer")

local size = 9

function harvest()
  robot.forward()
  for y=1, size do
    robot.useDown()
    for x=1, (size-1) do
      robot.forward()
      robot.useDown()
    end
        -- turn
    if y%2 == 1 then
          robot.turnLeft()
          robot.forward()
          robot.turnLeft()
        else
          robot.turnRight()
          robot.forward()
          robot.turnRight()
        end
  end
  for y=1, (size-1) do
    robot.forward()
  end
  robot.turnLeft()
  for y=1, (size-1) do
    robot.forward()
  end
  robot.turnRight()
  robot.forward()
  robot.turnAround()
end

function unload()
  robot.turnAround()
  for c = 1, 16 do
    robot.select(c)
    robot.drop()
  end
  robot.select(1)
  robot.turnAround()
end

while true do
  harvest()
  unload()
  for i=1, 10 do
    os.sleep(360)
    print((10*i)..'%')
  end
  print('Starting pick a harvest...')
end