function EFFECT:Init( data )
    local vOffset = data:GetOrigin()
    self.Ent = data:GetEntity()
    if not IsValid( self.Ent ) then return end
    self.Position = vOffset
    self.Scayul = data:GetScale()
    local emitter = ParticleEmitter( data:GetOrigin() )
    local rollparticle = emitter:Add( "sprites/animglow02", vOffset )

    if rollparticle then
        rollparticle:SetVelocity( self.Ent:GetVelocity() )
        rollparticle:SetLifeTime( 0 )
        local life = .4 * self.Scayul ^ 0.25
        rollparticle:SetDieTime( life )
        rollparticle:SetColor( 0, 255, 255 )
        rollparticle:SetStartAlpha( 255 )
        rollparticle:SetEndAlpha( 0 )
        rollparticle:SetStartSize( 150 * self.Scayul )
        rollparticle:SetEndSize( 0 )
        rollparticle:SetRoll( math.Rand( -360, 360 ) )
        rollparticle:SetRollDelta( math.Rand( -0.61, 0.61 ) * 5 )
        rollparticle:SetAirResistance( 0 )
        rollparticle:SetGravity( Vector( 0, 0, 0 ) )
        rollparticle:SetCollide( false )
        rollparticle:SetLighting( false )
    end

    local rollparticle2 = emitter:Add( "sprites/animglow02", vOffset )

    if rollparticle2 then
        rollparticle2:SetVelocity( self.Ent:GetVelocity() )
        rollparticle2:SetLifeTime( 0 )
        local life = .4 * self.Scayul ^ 0.25
        rollparticle2:SetDieTime( life )
        rollparticle2:SetColor( 255, 255, 255 )
        rollparticle2:SetStartAlpha( 255 )
        rollparticle2:SetEndAlpha( 0 )
        rollparticle2:SetStartSize( 40 * self.Scayul )
        rollparticle2:SetEndSize( 0 )
        rollparticle2:SetRoll( math.Rand( -360, 360 ) )
        rollparticle2:SetRollDelta( math.Rand( -0.61, 0.61 ) * 5 )
        rollparticle2:SetAirResistance( 0 )
        rollparticle2:SetGravity( Vector( 0, 0, 0 ) )
        rollparticle2:SetCollide( false )
        rollparticle2:SetLighting( false )
    end

    emitter:Finish()
    local dlight = DynamicLight( self:EntIndex() )

    if dlight then
        dlight.Pos = vOffset
        dlight.r = 0
        dlight.g = 255
        dlight.b = 255
        dlight.Brightness = 1.2 * self.Scayul
        dlight.Size = 600 * self.Scayul
        dlight.Decay = 3500 * self.Scayul
        dlight.DieTime = CurTime() + .5 * self.Scayul ^ 0.25
        dlight.Style = 0
    end
end

function EFFECT:Render()
end
