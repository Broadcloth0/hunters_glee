function EFFECT:Init( data )
    self.StartPos = data:GetStart()
    self.EndPos = data:GetOrigin()
    self.Scayul = data:GetScale()
    self.Delay = math.Clamp( 0.06 * self.Scayul, 0.025, 0.25 )
    self.EndTime = CurTime() + self.Delay
    self:SetRenderBoundsWS( self.StartPos, self.EndPos )
    -- dont interfere with spectate flashlights pls
    local dlightend = DynamicLight( #player.GetAll() + 1 )
    dlightend.Pos = self.EndPos
    dlightend.Size = 500 * self.Scayul
    dlightend.Decay = 3000
    dlightend.R = 100
    dlightend.G = 150
    dlightend.B = 255
    dlightend.Brightness = math.Clamp( 1.25 * self.Scayul, 0, 10 )
    dlightend.DieTime = CurTime() + self.Delay + 2

end

function EFFECT:Think()
    if self.EndTime < CurTime() then
        return false
    else
        return true
    end
end

function EFFECT:Render()
    self:SetRenderBoundsWS( self.StartPos, self.EndPos )

    local Beamtwo = CreateMaterial( "xeno/beamlightning", "UnlitGeneric", {
        ["$basetexture"] = "sprites/spotlight",
        ["$additive"] = "1",
        ["$vertexcolor"] = "1",
        ["$vertexalpha"] = "1",
    } )

    render.SetMaterial( Beamtwo )
    render.DrawBeam( self.StartPos, self.EndPos, Lerp( ( self.EndTime - CurTime() ) / self.Delay, 0, 8 * self.Scayul ), 0, 0, Color( 100, 150, 255, 255 ) )
end
