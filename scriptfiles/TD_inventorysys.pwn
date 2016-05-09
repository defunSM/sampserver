
//Player Textdraws:

new PlayerText:Textdraw0[MAX_PLAYERS];
new PlayerText:Textdraw1[MAX_PLAYERS];
new PlayerText:Textdraw2[MAX_PLAYERS];


Textdraw0[playerid] = CreatePlayerTextDraw(playerid, 367.200042, 251.626602, "Slot 0");
PlayerTextDrawLetterSize(playerid, Textdraw0[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, Textdraw0[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw0[playerid], 16777215);
PlayerTextDrawSetShadow(playerid, Textdraw0[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw0[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw0[playerid], 51);
PlayerTextDrawFont(playerid, Textdraw0[playerid], 1);
PlayerTextDrawSetProportional(playerid, Textdraw0[playerid], 1);

Textdraw1[playerid] = CreatePlayerTextDraw(playerid, 367.200012, 242.666625, "Slot 1");
PlayerTextDrawLetterSize(playerid, Textdraw1[playerid], 0.200000, 1.000000);
PlayerTextDrawTextSize(playerid, Textdraw1[playerid], 1.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Textdraw1[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw1[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw1[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw1[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw1[playerid], 51);
PlayerTextDrawFont(playerid, Textdraw1[playerid], 1);
PlayerTextDrawSetProportional(playerid, Textdraw1[playerid], 1);

Textdraw2[playerid] = CreatePlayerTextDraw(playerid, 368.000000, 261.333343, "Slot 2");
PlayerTextDrawLetterSize(playerid, Textdraw2[playerid], 0.200000, 1.000000);
PlayerTextDrawAlignment(playerid, Textdraw2[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw2[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw2[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw2[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw2[playerid], 51);
PlayerTextDrawFont(playerid, Textdraw2[playerid], 1);
PlayerTextDrawSetProportional(playerid, Textdraw2[playerid], 1);

