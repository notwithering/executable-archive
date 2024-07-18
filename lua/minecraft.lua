local math = require("math")
local m=math
p={}
for i=1,40 do
  for j=1,40 do
    local x = (1 + 0.2 * m.cos(j / 5)) * m.cos(i / 5)
    local y = (1 + 0.2 * m.cos(j / 5)) * m.sin(i / 5)
    local z = 0.2 * m.sin(j / 5)
    table.insert(p, {x = x, y = y, z = z})
  end
end
s={}
for i=1,25 do
  s[i]={}
  for j=1,80 do
    s[i][j]=" "
  end
end
angleX,angleY,angleZ=0,0,0
function project(point, angleX, angleY, angleZ)
    local x = point.x * math.cos(angleY) - point.z * math.sin(angleY)
    local y = point.x * math.sin(angleZ) + point.y * math.cos(angleZ)
    local z = point.y * math.sin(angleX) + point.z * math.cos(angleX)
    return {x = x, y = y, z = z}
end
while true do
  for i,point in ipairs(p) do
    local projected = project(point, angleX, angleY, angleZ)
    local x,y=projected.x,projected.y
    if x>0 and x<=80 and y>0 and y<=25 then
      s[y][x] = "#"
    end
  end
  for i=1,25 do
    for j=1,80 do
      io.write(s[i][j])
    end
    print()
  end
  angleX = angleX + 0.01
  angleY = angleY + 0.01
  angleZ = angleZ + 0.01
  io.read()
  for i=1,25 do
    for j=1,80 do
      s[i][j] = " "
    end
  end
end

