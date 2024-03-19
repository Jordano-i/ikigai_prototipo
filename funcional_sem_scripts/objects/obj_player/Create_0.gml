#region VARIAVEIS AUXILIARES
hsp = 0;
vsp = 0;
spd = 6;
grav = 1;
jspd = -18;
jumps = 1;
moveDir = 0;
hp = 100;
points = 0;
#endregion

#region ESTADOS
enum st {
    idle, move, fall, jump, attack, damage
}

state = st.idle;
image_xscale = 5.0;

// SPRITES
sprites[st.idle] = spr_playerIdle;
sprites[st.move] = spr_playerRun;
sprites[st.fall] = spr_playerFall;
sprites[st.jump] = spr_playerJump;
sprites[st.attack] = spr_playerAttack1;
sprites[st.damage] = spr_playerHit;
#endregion