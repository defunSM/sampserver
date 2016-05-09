
//Player Textdraws:

new PlayerText:levelstat[MAX_PLAYERS];


levelstat[playerid] = CreatePlayerTextDraw(playerid, 133.600021, 409.919982, "Level: 1");
PlayerTextDrawLetterSize(playerid, levelstat[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, levelstat[playerid], 1);
PlayerTextDrawColor(playerid, levelstat[playerid], 16777215);
PlayerTextDrawSetShadow(playerid, levelstat[playerid], 0);
PlayerTextDrawSetOutline(playerid, levelstat[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, levelstat[playerid], 51);
PlayerTextDrawFont(playerid, levelstat[playerid], 1);
PlayerTextDrawSetProportional(playerid, levelstat[playerid], 1);

