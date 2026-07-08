
local a,b,c,d,e=game:GetService("Players"),game:GetService("ReplicatedStorage"),game:GetService("Workspace"),game:GetService("HttpService"),nil
local f=a.LocalPlayer


local g=loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()


local h,i,j,k=0.5,0.5,0.5,1
local l,m,n=false,false,false
local o,p,q=false,false,false
local r={"Carrot","Strawberry","Blueberry"}
local s,t={},{}


local u,v,w,x,y,z
local aa,ab,ac

pcall(function()
local ad=b:WaitForChild("SharedModules")
u=require(ad:WaitForChild("Networking"))
v=b.StockValues.SeedShop.Items
w=b.StockValues.GearShop.Items
x=b.StockValues.CrateShop.Items
y=c:WaitForChild("Gardens")
z=b:WaitForChild("Night")
aa=u.SeedShop.PurchaseSeed
ab=u.GearShop.PurchaseGear
ac=u.CrateShop.PurchaseCrate
end)


local ae
task.spawn(function()while not ae do task.wait(1)for af,ag in pairs(y:GetChildren())do if ag:GetAttribute("Owner")==f.Name then ae=ag break end)


local function ah(ai,aj,ak)if not ai or not aj then return end for al,am in pairs(ai:GetChildren())do if am.Value>0 and table.find(ak,am.Name)then pcall(function()aj:Fire(am.Name)end)task.wait(0.1)end end


local function an()if not ae then return end local ao=ae:FindFirstChild("Plants")if not ao then return end for ap,aq in pairs(ao:GetChildren())do local ar=aq:FindFirstChild("Fruits")if ar then for as,at in pairs(ar:GetChildren())do pcall(function()u.Garden.CollectFruit:Fire(aq:GetAttribute("PlantId"),at:GetAttribute("FruitId")or"")end)task.wait(0.15)end end


local function au()pcall(function()u.NPCS.SellAll:Fire()end)end


local function av()if not z.Value then return end local aw=f.Character and f.Character:FindFirstChild("HumanoidRootPart")if not aw then return end for ax,ay in pairs(y:GetChildren())do if ay~=ae and ay:FindFirstChild("Plants")then for az,ba in pairs(ay.Plants:GetChildren())do local bb,bc=ba:GetAttribute("UserId"),ba:GetAttribute("PlantId")local bd=ba:FindFirstChildWhichIsA("BasePart")if bb and bc and bd then local be=aw.CFrame aw.CFrame=bd.CFrame+Vector3.new(0,3,0)task.wait(0.2)pcall(function()u.Steal.BeginSteal:Fire(tonumber(bb),bc,"")u.Steal.CompleteSteal:Fire()end)task.wait(0.2)aw.CFrame=be return end


local bf,bg,bh={},{} 
pcall(function()for bi,bj in pairs(v:GetChildren())do table.insert(bf,bj.Name)end for bk,bl in pairs(w:GetChildren())do table.insert(bg,bl.Name)end for bm,bn in pairs(x:GetChildren())do table.insert(bh,bn.Name)end end)


local bo="R1JPVyBBIEdBUkRFTiAyIHx8fCBPV05FUiBHUkFWRSDimqQ=
local bp="bGVhZg==" 
local bq="RGFyaw==" 
local br=e:Base64Decode(bo)local bs=e:Base64Decode(bp)local bt=e:Base64Decode(bq)

local bu=g:CreateWindow({
    Title=br,
    Icon=bs,
    Size=UDim2.fromOffset(320,380),
    Theme=bt,
    Config={Accent=Color3.fromRGB(0,170,255)}
})


          
local bv=bu:Tab({Title="Farm",Icon="zap"})
bv:Toggle({Title="Auto Collect",Desc="Collect All",Callback=function(bw)o=bw end})
bv:Toggle({Title="Auto Sell",Desc="Sell All",Callback=function(bx)p=bx end})
bv:Toggle({Title="Auto Steal",Desc="Night time babyHahaha",Callback=function(by)q=by end})

local bz=bu:Tab({Title="Shop",Icon="shopping-cart"})
bz:Toggle({Title="Auto Buy Seeds",Callback=function(ca)l=ca end})
bz:Dropdown({Title="Select",Multi=true,Values=bf,Default=r,Callback=function(cb)r=cb end})
bz:Toggle({Title="Auto Buy Gears",Callback=function(cc)m=cc end})
bz:Dropdown({Title="Select",Multi=true,Values=bg,Callback=function(cd)s=cd end})
bz:Toggle({Title="Auto Buy Crates",Callback=function(ce)n=ce end})
bz:Dropdown({Title="Select",Multi=true,Values=bh,Callback=function(cf)t=cf end})


task.spawn(function()while task.wait(i)do if o then an()end end)
task.spawn(function()while task.wait(j)do if p then au()end end)
task.spawn(function()while task.wait(k)do if q then av()end end)
task.spawn(function()while task.wait(h)do if l and #r>0 then ah(v,aa,r)end if m and #s>0 then ah(w,ab,s)end if n and #t>0 then ah(x,ac,t)end end)


local cg=bu:Tab({Title="Predictor",Icon="list"})
local ch=cg:Paragraph({Title="Hasil Prediction",Desc="Click Refress"})
local ci=""
local function cj(ck)ci=ci..tostring(ck).."\n"ch:SetDesc(ci)end print=cj warn=cj
local cl=false
cg:Button({Title="Load Weather + Moon Predictor",Icon="download",Callback=function()if not cl then cl=true cj("Grave in Here")task.spawn(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Lutosys/opensrc/refs/heads/main/gag2weatherpredictor.lua"))()end)g:Notify({Title="Berhasil",Content="Script sudah jalan. Lihat di bagian Hasil",Duration=3})else g:Notify({Title="Info",Content="Script sudah di load",Duration=2})end end})
cg:Button({Title="Clear Log",Icon="trash",Callback=function()ci=""ch:SetDesc("Log dihapus...")end})
bu:SelectTab(1)g:Notify({Title="Loaded",Content="Grave Combo Loaded",Duration=3})
