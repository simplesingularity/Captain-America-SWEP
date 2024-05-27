AddCSLuaFile()

 
ENT.Base = "base_anim"
 
ENT.PrintName = "Captain america shield thrown"
ENT.Category = "Rottweiler"
ENT.Spawnable = true
ENT.AdminOnly = false
ENT.AdminSpawnable = false

function ENT:Initialize()
	self:SetModel( "models/shield/cashield.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetMoveCollide(MOVECOLLIDE_FLY_BOUNCE)
end
 
function ENT:Use( activator, caller )
    return
end

function ENT:PhysicsCollide( data, phys )
	if ( data.Speed > 120 ) then self:EmitSound( Sound( "physics/metal/metal_box_impact_hard3.wav" ) ) end
	--if ( data.Speed > 50 ) then self:EmitSound( Sound( "Flashbang.Bounce" ) ) end
	local target = phys.HitEntity or data.HitObject:GetEntity()
	if(target == self.Owner)then
		self:Remove()
		return true
	end
	if (target:IsNPC() or target:IsPlayer()) then
		target:TakeDamage(100, self.Owner, self)

	end
		timer.Simple(3, function() 
			if(IsValid(self))then self:Remove() end
		end)
	return true
end