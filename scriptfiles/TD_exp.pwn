
//Player Textdraws:

new PlayerText:expstat[MAX_PLAYERS];


expstat[playerid] = CreatePlayerTextDraw(playerid, 123.999969, 433.813385, "XP (0/20)");
PlayerTextDrawLetterSize(playerid, expstat[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, expstat[playerid], 1);
PlayerTextDrawColor(playerid, expstat[playerid], -1);
PlayerTextDrawSetShadow(playerid, expstat[playerid], 0);
PlayerTextDrawSetOutline(playerid, expstat[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, expstat[playerid], 51);
PlayerTextDrawFont(playerid, expstat[playerid], 1);
PlayerTextDrawSetProportional(playerid, expstat[playerid], 1);

