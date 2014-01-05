
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )


// Serverside only stuff goes here

/*---------------------------------------------------------
   Name: gamemode:PlayerLoadout( )
   Desc: Give the player the default spawning weapons/ammo
---------------------------------------------------------*/
function GM:PlayerLoadout( pl )

	pl:GiveAmmo( 255,	"Pistol", 		true )
	
	//pl:Give( "empty_weapon" )

	//barrel=ents.Create("prop_physics")
	//barrel:SetModel("models/props_c17/oildrum001.mdl")
	//barrel:SetPos(Vector(0,0,0))
	//barrel:Spawn()
	
end

function GM:PlayerSpawn( ply )

	ply:Give("weapon_crowbar")
	ply:Give("weapon_pistol")
		
	local tr = ply:GetEyeTrace() -- tr now contains a trace object
	local ent = ents.Create("npc_zombie") -- This creates our zombie entity
	ent:SetPos(tr.HitPos) -- This positions the zombie at the place our trace hit.
	ent:Spawn() -- This method spawns the zombie into the world, run for your lives! ( or just crowbar it dead(er) )
	ply:ChatPrint( "Hello : " .. ply:Nick() )
end


function GM:Playerhurt( victim, attacker )
   
    victim:ChatPrint( "You were attacked by : " )
    
end


function GM:PlayerSwitchWeapon(  ply,  oldWeapon,  newWeapon )

	//local tr = ply:GetEyeTrace() -- tr now contains a trace object
	//local ent = ents.Create("npc_combinedropship") -- This creates our zombie entity
	//ent:SetPos(tr.HitPos) -- This positions the zombie at the place our trace hit.
	//ent:Spawn() -- This method spawns the zombie into the world, run for your lives! ( or just crowbar it dead(er) )
	drop_by_drop_ship( ) 
end


function GM:OnNPCKilled(  npc, attacker,  inflictor )

	local dp = npc:GetPos()
	for i=1,2 
	do 
		local ent = ents.Create("npc_zombie") -- This creates our zombie entity
		ent:SetPos(dp) -- This positions the zombie at the place our trace hit.
		
		timer.Simple( 10 + i, function() ent:Spawn() end  )
		
	end
	
end 

function GM:Move( ply,  cmd )

	print( ply:GetPos() )
end

function drop_by_drop_ship( )
	local vector = Vector( 100, 100, 100 )	
	local ent = ents.Create("npc_combinedropship") -- This creates our drop ship entity
	ent:SetPos(vector) -- This positions the zombie at the place our trace hit.
	ent:Spawn() -- This method spawns the zombie into the world, run for your lives! ( or just crowbar it dead(er) )
end


